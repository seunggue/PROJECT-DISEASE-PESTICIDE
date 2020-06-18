import 'package:calcul/top_drawer.dart';
import 'package:flutter/material.dart';

class BugPage extends StatefulWidget {
  @override
  _BugPageState createState() => _BugPageState();
}

class _BugPageState extends State<BugPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Text('여기는 지도 페이지'),
      endDrawer: MyDrawer(),
    );
  }
}
