import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class OTPTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'This code shall expire in 30s',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(12),
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }
}
