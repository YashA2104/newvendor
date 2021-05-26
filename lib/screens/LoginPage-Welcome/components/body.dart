import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/LoginPage-Welcome/components/bottom_text.dart';
import 'package:vendor/screens/LoginPage-Welcome/components/display_login_company_icons.dart';
import 'package:vendor/screens/LoginPage-Welcome/components/login_page_form.dart';
import 'package:vendor/size_config.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                'Welcome Back',
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(24),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Please sign in with your email and password to \ncontinue with Kartex Business',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(12),
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 35),
              LoginPageForm(),
              SizedBox(
                height: getProportionateScreenWidth(100),
              ),
              DisplayLoginCompanyIcons(),
              SizedBox(
                height: getProportionateScreenWidth(5),
              ),
              BottomText(),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
