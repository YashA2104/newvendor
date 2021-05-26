import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Notification/components/notification_body.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/size_config.dart';

class Notifications extends StatelessWidget {
  static String routeName = '/Notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kSecondaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ShopProfile.routeName);
            },
          ),
        ),
        elevation: 0,
        title: Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: NotificationsBody(),
    );
  }
}
