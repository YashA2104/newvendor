
import 'package:flutter/material.dart';
import 'package:vendor/screens/HelpCenter/components/help_center_body.dart';
import 'package:vendor/size_config.dart';


class HelpCenter extends StatelessWidget {
  static String routeName = '/HelpCenter';
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
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        title: Text(
          'Help Center',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: HelpCenterBody(),
    );
  }
}
