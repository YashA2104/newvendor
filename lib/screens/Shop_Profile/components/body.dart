
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor/screens/Feedback/feedback.dart';
import 'package:vendor/screens/HelpCenter/help_center.dart';
import 'package:vendor/screens/LoginPage-Welcome/login_page.dart';
import 'package:vendor/screens/MyShop/myshop.dart';
import 'package:vendor/screens/Notification/notifications.dart';
import 'package:vendor/screens/SettingsScreen/settings.dart';
import 'package:vendor/screens/ShopStatus/shopstatus.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String shopStatus;

  getDoc()async{
    DocumentSnapshot doc = await FirebaseFirestore.instance.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).get();
    shopStatus = doc['shopStatus'];
    print(shopStatus);
  }

  deleteShop() async{
    FirebaseFirestore fs = await FirebaseFirestore.instance;
    await FirebaseAuth.instance.currentUser.delete();
    await fs.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).delete().whenComplete(() => {
      Fluttertoast.showToast(msg: 'Shop has been removed!!'),
    });
  }
  @override
  Widget build(BuildContext context) {
    setState(() {
      getDoc();
    });
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: shopStatus=='Verified'? "Shop Status - 'LIVE' " :  "Shop Status - 'NOT LIVE' ",
            icon: "assets/icons/Shop Icon.svg",
            press: () async  {
              await getDoc();
              Navigator.pushNamed(context, ShopStatus.routeName);
            },
          ),
          ProfileMenu(
            text: "My Shop",
            icon: "assets/icons/User Icon.svg",
            press: () async{
              FirebaseFirestore fs  = await FirebaseFirestore.instance;
              String id = FirebaseAuth.instance.currentUser.uid.toString();
              DocumentSnapshot doc = await fs.collection('vendor').doc(id).collection('shop').doc('details').get();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MyShop(
                uid: FirebaseAuth.instance.currentUser.uid,
                shopName: doc['shopName'],
                shopAddress: doc['shopAddress'],
                shopType: doc['shopType'],
              )));
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {
              Navigator.pushNamed(context, Notifications.routeName);
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              //Navigator.pushNamed(context, Settings.routeName);
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, HelpCenter.routeName);
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              FirebaseAuth.instance.signOut().whenComplete(() => {
                Fluttertoast.showToast(msg: 'You have been signed out !!'),
                Navigator.pushNamed(context, LoginPage.routeName),
              });

            },
          ),
          ProfileMenu(
            text: "FeedBack",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.pushNamed(context, FeedbackScreen.routeName);
            },
          ),
          ProfileMenu(
            text: "Remove Your Shop",
            icon: "assets/icons/Log out.svg",
            press: () async{
              deleteShop();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

