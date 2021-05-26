
import 'package:flutter/material.dart';
import 'package:vendor/screens/SettingsScreen/components/settings_body.dart';
import 'package:vendor/size_config.dart';


class Settings extends StatelessWidget {
  static String routeName = '/Settings';
  @override
  Widget build(BuildContext context) {
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
          'Settings',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
      body: SettingsBody(),
    );
  }
}
