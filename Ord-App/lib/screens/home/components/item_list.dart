import 'package:flutter/material.dart';
import 'package:food_app/screens/details/details-screen.dart';
import 'package:food_app/screens/home/components/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            svgSrc: "assets/icons/Following.svg",
            title: "고추 병해충",
            shopName: "SJ_Company",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen();
                  },
                ),
              );
            },
          ),
          ItemCard(
            svgSrc: "assets/icons/Following.svg",
            title: "사과 병해충",
            shopName: "SJ_Company",
            press: () {},
          ),
          ItemCard(
            svgSrc: "assets/icons/Following.svg",
            title: "벼 병해충",
            shopName: "SJ_Company",
            press: () {},
          )
        ],
      ),
    );
  }
}
