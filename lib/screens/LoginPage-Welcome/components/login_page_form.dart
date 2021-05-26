import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor/components/check_box.dart';
import 'package:vendor/components/form_detail.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Forgot%20Password/forgot_password.dart';
import 'package:vendor/screens/Login%20Success/login_success.dart';
import 'package:vendor/size_config.dart';

class LoginPageForm extends StatelessWidget {
  String email, pass;

  TextEditingController nameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  void getValues() {
    email = nameController.text.toString();
    pass = passController.text.toString();
  }

  Future<void> logIn(context) async {
    getValues();
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: pass);
    String Uid;
    Uid = user.user.uid;
    Fluttertoast.showToast(msg: Uid);
    DocumentSnapshot doc = await firebaseFirestore
        .collection('vendor')
        .doc(Uid)
        .collection('user')
        .doc('details')
        .get();
    if (user != null && doc.exists) {
      Fluttertoast.showToast(msg: "Logged In Successfully");
      Navigator.pushNamed(context, LoginSuccess.routeName);
    } else {
      Fluttertoast.showToast(msg: 'You are not registered as Vendor');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Form(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(50),
                ),
                FormDetails(
                  controller: nameController,
                  labelText: 'Enter Email',
                  hint: 'Enter your email',
                ),
                SizedBox(height: 30),
                FormDetails(
                  controller: passController,
                  labelText: 'Password',
                  hint: 'Enter your password',
                ),
                SizedBox(height: getProportionateScreenWidth(50)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(40),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Container(
            height: getProportionateScreenWidth(45),
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () {
                logIn(context);
              },
              color: kSecondaryColor,
              child: Text('Continue',
                  style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: kPrimaryColor,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ForgotPassword.routeName);
          },
          child: Text(
            'Forgot Password',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
