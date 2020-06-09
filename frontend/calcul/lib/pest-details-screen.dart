import 'package:calcul/model/pest_model.dart';
import 'package:calcul/pest_detail.dart';
import 'package:calcul/top_drawer.dart';
import 'package:flutter/material.dart';
import 'package:calcul/constants.dart';
import 'package:calcul/screens/details/components/app_bar.dart';
import 'package:calcul/screens/details/components/body.dart';

class PestDetailScreen extends StatelessWidget {
  Pest pest;
  PestDetailScreen(this.pest);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: detailsAppBar(),
      resizeToAvoidBottomInset : false,
      body: Pest_Detail(pest),
      endDrawer: MyDrawer(),
    );
  }
}
