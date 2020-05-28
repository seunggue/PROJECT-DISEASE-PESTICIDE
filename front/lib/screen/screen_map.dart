import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';

class MapScreen extends StatefulWidget{

  @override
  _MapScreenState createState() => _MapScreenState();
}


class _MapScreenState extends State<MapScreen> {
//  final _webViewController = WebViewController();
//  WebViewController _webViewController;
  @override
  Widget build(BuildContext context){
//    Size screenSize = MediaQuery.of(context).size;
//    double width = screenSize.width;
//    double height = screenSize.height;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('맵 뷰'),
      ),
      body:
        WebviewScaffold(
          url: 'http://3f465fa16d44.ngrok.io/map',
//      WebView(
//        userAgent: "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Mobile Safari/537.36",
//        initialUrl: '',
//        javascriptMode: JavascriptMode.unrestricted,
//        onWebViewCreated: (WebViewController webViewController){
//          _webViewController = webViewController;
//          _loadHtmlFromAssets();
//        },
      )
    ));

  }

}