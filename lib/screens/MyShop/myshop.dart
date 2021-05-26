import 'package:flutter/material.dart';
import 'package:vendor/screens/MyShop/components/body.dart';
import 'package:vendor/screens/Photo%20Options/photo_options.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/size_config.dart';

class MyShop extends StatelessWidget {
  String uid, shopName, shopAddress, shopType, catImageURL, shopImageURL;
  MyShop({
    @required this.shopAddress,
    @required this.shopName,
    @required this.shopType,
    @required this.uid,
    @required this.shopImageURL,
    @required this.catImageURL,
  });
  static String routeName = '/MyShop';
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
          'My Shop',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Body(
        catImageURL: catImageURL,
        shopImageURL: shopImageURL.isNotEmpty ? '123' : shopImageURL,
        shopType: shopType,
        shopAddress: shopAddress,
        shopName: shopName,
        uid: uid,
      ),
      /*floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.redAccent,
          onPressed: () {
            Navigator.pushNamed(context, PhotoOptions.routName);
          },
          child: Icon(
            Icons.add_a_photo_outlined,
            color: Colors.white,
          )),*/
    );
  }
}
