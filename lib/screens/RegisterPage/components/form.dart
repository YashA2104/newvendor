import 'package:flutter/material.dart';
import 'package:vendor/components/form_detail.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Complete%20Profile/complete_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String email, pass, rePass;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController repassController = new TextEditingController();

  void registerUser() async {
    if ((email.isNotEmpty && pass.isNotEmpty && rePass.isNotEmpty) &&
        (pass == rePass)) {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      if (user != null) {
        Navigator.pushNamed(context, CompleteProfile.routeName);
        Fluttertoast.showToast(msg: 'User has been Register Successfully !');
      } else {
        Fluttertoast.showToast(msg: 'We have got some problems Try Again !');
      }
    } else {
      Fluttertoast.showToast(msg: 'Kindly Enter Correct Information');
    }
  }

  void getValues() {
    email = emailController.text.toString();
    pass = passController.text.toString();
    rePass = repassController.text.toString();
  }

  uploadDetails() async {
    FirebaseFirestore firebaseFirestore = await FirebaseFirestore.instance;
    firebaseFirestore
        .collection('vendor')
        .doc(FirebaseAuth.instance.currentUser.uid.toString())
        .collection('user')
        .doc('details')
        .set({
      'email': email,
      'password': pass,
      'firstName': '',
      'lastName': '',
      'phoneNumber': '',
      'address': '',
    }).whenComplete(() => {
              Fluttertoast.showToast(msg: 'Details are saved Successfully!'),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          FormDetails(
            labelText: 'Email',
            hint: 'Enter your email',
            controller: emailController,
          ),
          SizedBox(
            height: 30,
          ),
          FormDetails(
            labelText: 'Password',
            hint: 'Enter your passowrd',
            controller: passController,
          ),
          SizedBox(
            height: 30,
          ),
          FormDetails(
            controller: repassController,
            labelText: 'Re-enter password',
            hint: 'Re-enter your password',
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onPressed: () async {
                await getValues();
                await registerUser();
                await uploadDetails();
                Navigator.pushNamed(context, CompleteProfile.routeName);
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
          )
        ],
      ),
    );
  }
}
