import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Forgot%20Password/components/body.dart';
import 'package:vendor/screens/LoginPage-Welcome/login_page.dart';
import 'package:vendor/size_config.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/forgot_password";
  const ForgotPassword({Key key}) : super(key: key);

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
            Navigator.pushNamed(context, LoginPage.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Email Verification',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(child: ForgotPasswordBody()),
    );
  }
}
