import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Function handler;
  Button({this.icon, this.handler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(50),
      height: getProportionateScreenWidth(50),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kPrimaryColor,
      ),
      child: IconButton(
        onPressed: handler,
        icon: Icon(
          icon,
          color: kSecondaryLightColor,
          size: 30,
        ),
      ),
    );
  }
}
