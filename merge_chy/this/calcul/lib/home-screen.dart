import 'package:flutter/material.dart';
import 'package:calcul/components/bottom_nav_bar.dart';
import 'package:calcul/screens/home/components/app_bar.dart';
import 'package:calcul/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: BottomNavBar(),
      resizeToAvoidBottomInset : false,
      body: Body(),
    );
  }
}