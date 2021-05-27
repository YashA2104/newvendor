
import 'package:flutter/material.dart';
import 'package:vendor/screens/ShopStatus/components/body.dart';
import 'package:vendor/size_config.dart';

class ShopStatus extends StatelessWidget {
  String shopStatus;

  ShopStatus({
    @required this.shopStatus,
});
  static String routeName = '/ShopStatus';
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
            // Navigator.pushNamed(context, ShopProfile.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Shop Status',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Body(shopStatus: shopStatus,),
    );
  }
}
