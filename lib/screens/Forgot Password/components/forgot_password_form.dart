import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor/components/form_detail.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/EmailVerification/EmailVerification.dart';
import 'package:vendor/size_config.dart';

class ForgotPasswordForm extends StatelessWidget {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FormDetails(
              controller: emailController,
              labelText: 'Email',
              hint: 'Enter your email',
            ),
            SizedBox(height: 200),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .whenComplete(() => {
                            Fluttertoast.showToast(
                                msg: 'Reset Password Email has been sent !!!'),
                            Navigator.pushNamed(
                                context, EmailVerification.routeName),
                          });
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
            SizedBox(height: getProportionateScreenHeight(100)),
          ],
        ),
      ),
    );
  }
}
