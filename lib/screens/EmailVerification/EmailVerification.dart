import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/EmailVerification/components/body.dart';
import 'package:vendor/size_config.dart';

class EmailVerification extends StatelessWidget {
  static String routeName = '/EmailVerification';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          ' Email Sent',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
