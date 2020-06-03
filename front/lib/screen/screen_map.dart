import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  WebviewScaffold webview = WebviewScaffold(
    url: 'http://7e97851564ca.ngrok.io/map',
    geolocationEnabled: true,
//    withZoom: true,
    useWideViewPort: true,
//    displayZoomControls: true,
    withOverviewMode: true,
    resizeToAvoidBottomInset: true,
  );
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  flutterWebviewPlugin.onStateChanged.listen((viewState) async {
    if (viewState.type == WebViewState.finish)
})
  @override
  Widget build(BuildContext context) {
//    Size screenSize = MediaQuery.of(context).size;
//    double width = screenSize.width;
//    double height = screenSize.height;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('맵 뷰'),
            ),
            body: webview));
  }
}
