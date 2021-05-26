import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/RegisterSuccess/components/register_success.dart';
import 'package:vendor/size_config.dart';

class RegisterSuccess extends StatelessWidget {
  static String routeName = '/Registersuccess';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Registeration Success',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: kPrimaryColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
