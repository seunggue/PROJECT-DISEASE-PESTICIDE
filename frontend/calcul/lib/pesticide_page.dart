import 'package:calcul/top_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PesticidePage extends StatefulWidget {
  _PesticidePageState createState() => _PesticidePageState();
}

class _PesticidePageState extends State<PesticidePage> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text('농약'),
        ),
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Text(
                'Pesticide',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.lightGreen[200],
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
//                        labelText: '검색',
//                        labelStyle: TextStyle(),
                        hintText: '농약 검색',
                        focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0))),
                        enabledBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(color: Colors.white),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.4),
              Container(
                child: Center(
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0)),
                    color: Colors.white,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Mydialog();
                          });
                      print('눌림');
                    },
                    child: Text(
                      '농약 계산기',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        endDrawer: MyDrawer(),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class Mydialog extends StatefulWidget {
  @override
  _MydialogState createState() => _MydialogState();
}

class _MydialogState extends State<Mydialog> {
  var Result = "";
  TextEditingController pescontroll = TextEditingController();
  TextEditingController ratiocontroll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            controller: pescontroll,
            decoration: InputDecoration(labelText: "농약량(ml,g)을 입력해주세요"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: ratiocontroll,
            decoration: InputDecoration(labelText: "비율(배수)을 입력해주세요"),
          ),
          new Text(
            '물 양: $Result(L)',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            '계산하기',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            setState(() {
              double pes = double.parse(pescontroll.text);
              double ratio = double.parse(ratiocontroll.text);

              var temp = (pes * ratio) / 1000;
              Result = temp.toString();
            });
          },
        )
      ],
    );
  }
}

//100g에 10배면 1리터
//10g에 100배면 1리터
//5g에 200배면 1리터
