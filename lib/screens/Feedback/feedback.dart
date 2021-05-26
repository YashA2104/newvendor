
import 'package:flutter/material.dart';
import 'package:vendor/screens/Feedback/components/Feedbackbody.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/size_config.dart';

class FeedbackScreen extends StatelessWidget {
  static String routeName = '/Feedback';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ShopProfile.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'FeedBack',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: FeedbackBody(),
    );
  }
}
