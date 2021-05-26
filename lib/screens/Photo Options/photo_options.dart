import 'package:flutter/material.dart';
import 'package:vendor/screens/Photo%20Options/components/photo_option_body.dart';

import 'package:vendor/size_config.dart';

class PhotoOptions extends StatelessWidget {
  static const routName = '/photo-options';

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
          'My Shop',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: PhotoOptionsBody(),
    );
  }
}
