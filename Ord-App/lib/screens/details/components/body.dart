import 'package:flutter/material.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/screens/details/components/item_image.dart';
import 'package:food_app/screens/details/components/order_button.dart';
import 'package:food_app/screens/details/components/title_price_rating.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopeName(name: "병해충 세부 정보"),
          TitlePriceRating(
            name: "탄저병",
            numOfReviews: 4,
            rating: 4,
            price: 10,
            onRatingChanged: (value) {},
          ),
          Text(
            "탄저병은 역병과 더불어 고추에 가장 큰 피해를 주는 병으로 열매가 맺히기 시작하는 6월 상·하순부터 발생하기 시작하여 장마기를 지나 8～9월 고온다습한 조건에서 급속히 증가한다. 탄저병에 의한 수량손실은 연평균 15～60%에 이르는 것으로 알려져 있다. 탄저병균은 빗물에 의해 전파되므로 여름철 잦은 강우와 태풍에 의해 많이 발생한다.",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          // Free space  10% of total height
          OrderButton(
            size: size,
            press: () {},
          )
        ],
      ),
    );
  }

  Row shopeName({String name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name),
      ],
    );
  }
}
