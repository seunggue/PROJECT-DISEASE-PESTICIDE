import 'package:calcul/pest_detail.dart';
import 'package:calcul/top_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:calcul/bloc/crop_pest_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:calcul/model/pest_model.dart';
import 'dart:convert';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  WebviewScaffold webview = WebviewScaffold(
    url: ' http://k02c1021.p.ssafy.io/pages/map',
    geolocationEnabled: true,
//    withZoom: true,
    useWideViewPort: true,
//    displayZoomControls: true,
    withOverviewMode: true,
    resizeToAvoidBottomInset: true,
  );

  final unescape =new HtmlUnescape();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  final cropPestBloc = CropPestBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // appBar 밑에 탭이 붙기 누에 bottom에 TabBar 위젯을 추가해서 사용
            title: Text('병해충 예측 지도'),
            actions: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                      onPressed: () async {
                        String doc = await flutterWebviewPlugin.evalJavascript('document.documentElement.innerHTML');
                        doc = unescape.convert(doc);
                        doc = doc.replaceAll('\\u003C', '<').replaceAll('\\"', '"').replaceAll('\\n', '\n');
                        var dom = parse(doc);
                        var cropPest = dom.getElementById('cropPest').innerHtml;
                        var arr = cropPest.split(',');
                        var crop = arr[0];
                        var pest = arr[1];
                        var response = await http.get('http://k02c1021.p.ssafy.io/pages/$crop/crop/$pest/sicksearch/');
                        if (response.statusCode == 200){
                          Pest pest = Pest.fromJson(json.decode(response.body));
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pest_Detail(pest)));
                        }
                      },
                      color: Colors.green,
                      icon: const Icon(Icons.assignment),
                      label: Text('상세 정보'))) //
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: webview,
          ),
          endDrawer: MyDrawer(),
        ));
  }
}
