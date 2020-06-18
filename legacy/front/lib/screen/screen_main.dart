import 'package:flutter/material.dart';
import 'package:front/screen/screen_map.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // 기기의 높이와 넓이 가져오기
    double width = screenSize.width;
    double height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('병충해 예방 앱'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: Center(
                      child: ButtonTheme(
                          child: RaisedButton(
                              child: Text('맵으로',
                                  style: TextStyle(color: Colors.white)),
                              color: Colors.deepPurple,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MapScreen()));
                              }))))
            ]),
      ),
    );
  }
}
