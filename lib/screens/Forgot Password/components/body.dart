import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Forgot%20Password/components/forgot_password_form.dart';
import 'package:vendor/screens/LoginPage-Welcome/components/bottom_text.dart';
import 'package:vendor/size_config.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(25),
            ),
            Text(
              'Verification through Email',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Please enter your email and we\'ll send \nyou a link to return to your account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(12),
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 100),
            ForgotPasswordForm(),
            SizedBox(height: 40),
            BottomText(),
          ],
        ),
      ),
    );
  }
}
