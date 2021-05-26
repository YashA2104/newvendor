import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class OTPForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: getProportionateScreenWidth(60),
      child: TextFormField(
        style: TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        obscureText: true,
        decoration: InputDecoration(
          focusColor: kPrimaryColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: kPrimaryLightColor,
                  width: getProportionateScreenWidth(3))),
        ),
      ),
    );
  }
}
