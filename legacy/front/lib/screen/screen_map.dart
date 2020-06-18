import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:front/bloc/crop_pest_bloc.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> with TickerProviderStateMixin {
  WebviewScaffold webview = WebviewScaffold(
    url: 'http://362f8599d26c.ngrok.io/map',
    geolocationEnabled: true,
//    withZoom: true,
    useWideViewPort: true,
//    displayZoomControls: true,
    withOverviewMode: true,
    resizeToAvoidBottomInset: true,
  );

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
//            child: StreamBuilder<Pest>(
////              stream: cropPestBloc.cropPestResult$,
////              builder: (context, snapshot) {
////                if (snapshot.hasData) {
////                  return RaisedButton.icon(
////                      onPressed: () {
////                        var data = snapshot.data;
//////                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Catalog()));
////                      },
////                      color: Colors.green,
////                      icon: const Icon(Icons.assignment),
////                      label: Text('상세 정보'));
////                }
////                else{
////                  return CircularProgressIndicator();
////                }
////              }
////            ),
              child: RaisedButton.icon(
                  onPressed: () {
//                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Catalog()));
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
    ));
  }
}
