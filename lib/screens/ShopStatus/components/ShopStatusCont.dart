import 'package:flutter/material.dart';

import 'package:vendor/size_config.dart';

class ShopStatusCont extends StatelessWidget {
  const ShopStatusCont({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenWidth(15)),
      child: Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        height: getProportionateScreenHeight(220),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
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
    );
  }
}
