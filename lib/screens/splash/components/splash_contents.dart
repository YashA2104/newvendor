import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(
          flex: 2,
        ),
        Column(
          children: [
            Text(
              'Kart-Ex',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '--For Buisness--',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: getProportionateScreenWidth(10),
        ),
        Text(
          text,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(color: kPrimaryColor),
        ),
        Spacer(
          flex: 3,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(275),
          width: getProportionateScreenWidth(245),
        ),
      ],
    );
  }
}
