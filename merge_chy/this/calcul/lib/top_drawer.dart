// 오른쪽에있는 햄버거버튼

import 'package:calcul/pesticide_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '벌레박멸',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Colors.grey[850],
              ),
              title: Text('지도'),
              onTap: () {
                Navigator.pushNamed(context, '/bug_map');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.description,
                color: Colors.grey[850],
              ),
              title: Text('농약'),
              onTap: () {
//                print('asdf');
                Navigator.pushNamed(context, '/pesticidepage');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.equalizer,
                color: Colors.grey[850],
              ),
              title: Text('병해충'),
              onTap: () {
                print('병해충');
              },
            ),
            ListTile(
              title: Text('농약계산기', style: TextStyle(fontSize: 20), textAlign: TextAlign.end,),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return Mydialog();
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
