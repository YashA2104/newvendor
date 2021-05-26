import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/LoginPage-Welcome/login_page.dart';
import 'package:vendor/screens/RegisterPage/components/register_page_body.dart';
import 'package:vendor/size_config.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = "/registerPage_screen";
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
          'Sign Up',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(child: RegisterPageBody()),
    );
  }
}
