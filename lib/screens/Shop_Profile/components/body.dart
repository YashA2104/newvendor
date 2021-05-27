
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
  String uid, shopName, shopAddress, shopType, catImageURL, shopImageURL;
  Body({
    @required this.shopAddress,
    @required this.shopName,
    @required this.shopType,
    @required this.uid,
    @required this.shopImageURL,
    @required this.catImageURL,
});
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
    await fs.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).delete();
    await fs.collection('vendor').doc(FirebaseAuth.instance.currentUser.uid).delete().whenComplete(() => {
      Fluttertoast.showToast(msg: 'Shop has been removed!!'),
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDoc();
  }
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: 'Shop Status',
            icon: "assets/icons/Shop Icon.svg",
            press: () async  {
              var doc = await FirebaseFirestore.instance.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).get();
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShopStatus(shopStatus: doc['shopStatus'])));
            },
          ),
          ProfileMenu(
            text: "My Shop",
            icon: "assets/icons/User Icon.svg",
            press: () async{
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyShop(shopAddress: widget.shopAddress, shopName: widget.shopName, shopType: widget.shopType, uid: widget.uid, shopImageURL: widget.shopImageURL, catImageURL: widget.catImageURL)));
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

