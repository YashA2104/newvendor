import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(13),
            vertical: getProportionateScreenWidth(13)),
        child: Container(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
          height: getProportionateScreenHeight(220),
          width: double.infinity,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(15))),
          child: Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(15),
                top: getProportionateScreenWidth(15)),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
