import 'package:flutter/material.dart';
import 'package:vendor/size_config.dart';

class ShopImages extends StatelessWidget {
  static const routeName = '/shop-images';
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
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.pushNamed(context, ShopProfile.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Shop Images',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
