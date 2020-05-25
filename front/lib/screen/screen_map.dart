import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart';

class MapScreen extends StatefulWidget{

  @override
  _MapScreenState createState() => _MapScreenState();
}


class _MapScreenState extends State<MapScreen> {
//  final _webViewController = WebViewController();
  WebViewController _webViewController;
  @override
  Widget build(BuildContext context){
//    Size screenSize = MediaQuery.of(context).size;
//    double width = screenSize.width;
//    double height = screenSize.height;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('맵 뷰'),
      ),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      )
    ));

  }

  void _loadHtmlFromAssets() async {
    _webViewController.loadUrl("https://naver.com");
  }
}