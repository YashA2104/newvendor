import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/LoginPage-Welcome/components/body.dart';
import 'package:vendor/screens/splash/splash_screen.dart';
import 'package:vendor/size_config.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login_page";
  const LoginPage({Key key}) : super(key: key);

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
            Navigator.pushNamed(context, SplashScreen.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Sign In',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: LoginPageBody(),
    );
  }
}
