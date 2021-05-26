import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Docs/components/docsbody.dart';
import 'package:vendor/screens/OTP/otp_screen.dart';
import 'package:vendor/size_config.dart';

class Docs extends StatelessWidget {
  static String routeName = '/Docs';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: kSecondaryColor,
          ),
        ),
        title: Text(
          'Document Upload',
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
      ),
      body: DocsBody(),
      bottomNavigationBar: Container(
        color: Colors.grey.shade200,
        height: 75,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: getProportionateScreenWidth(20),
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)),
          ),
          child: RaisedButton(
            color: kSecondaryColor,
            onPressed: () {
              FirebaseFirestore.instance
                  .collection('shop')
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .set({
                'catImageURL': '',
                'shopImageURL': '',
              });
              Navigator.pushNamed(context, OTPScreen.routeName);
            },
            child: Text(
              'Upload Documents',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(18),
                  color: kPrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
