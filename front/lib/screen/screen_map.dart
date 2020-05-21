import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget{

  @override
  _MapScreenState createState() => _MapScreenState();
}


class _MapScreenState extends State<MapScreen> {

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(child: Container(
        child: Text('맵')
      ))
    ));

  }
}