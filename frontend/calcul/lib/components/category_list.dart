import 'package:flutter/material.dart';
import 'package:calcul/components/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "고추",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "배",
            press: () {},
          ),
          CategoryItem(
            title: "사과",
            press: () {},
          ),
          CategoryItem(
            title: "벼",
            press: () {},
          ),
        ],
      ),
    );
  }
}
