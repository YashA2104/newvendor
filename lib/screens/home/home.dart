import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor/components/custom_bottom_nav_bar.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/MyShop/myshop.dart';
import 'package:vendor/screens/Notification/notifications.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/screens/enums.dart';
import 'package:vendor/screens/home/components/body.dart';
import 'package:vendor/size_config.dart';

class HomeScreen extends StatefulWidget {
  String imageURL;
  HomeScreen({
    @required this.imageURL,
});
  static String routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
          child: IconButton(
            icon: Icon(
              Icons.menu,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Navigator.pushNamed(context, ShopProfile.routeName);
            },
          ),
        ),
        elevation: 0,
        title: Text(
          'My Shop',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(22),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Notifications.routeName);
              },
              icon: Icon(
                Icons.notifications,
                color: kPrimaryColor,

              ),
            ),
          ),
        ],
      ),
      body: Body(imageURL: widget.imageURL,),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}
