import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Complete%20Profile/components/complete_profile_body.dart';
import 'package:vendor/screens/RegisterPage/register_page.dart';
import 'package:vendor/size_config.dart';

class CompleteProfile extends StatelessWidget {

  String email,pass;
  CompleteProfile({
    @required this.email,
    @required this.pass,
});
  static String routeName = "/complete_profile";
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
            Navigator.pushNamed(context, RegisterPage.routeName);
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
      body: SingleChildScrollView(child: CompleteProfileBody()),
    );
  }
}
