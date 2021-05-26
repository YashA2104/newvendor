import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Complete%20Profile/complete_profile.dart';
import 'package:vendor/screens/OTP/components/otp_body.dart';
import 'package:vendor/size_config.dart';

class OTPScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kSecondaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, CompleteProfile.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'OTP Verification',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(child: OTPBody()),
    );
  }
}
