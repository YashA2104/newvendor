import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

import 'buttons.dart';

class DocsBody extends StatefulWidget {
  @override
  _DocsBodyState createState() => _DocsBodyState();
}

class _DocsBodyState extends State<DocsBody> {
  String DPpath;
  final picker = ImagePicker();
  File image;

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  String uImage, uid, uEmail;

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  String email, pass, name;
  FirebaseAuth _auth = FirebaseAuth.instance;

  uploadImages(String docType) async {
    await chooseImage();
    var storage = FirebaseStorage.instance
        .ref('Docs')
        .child(faker.person.name().toString());
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null).then((value) async {
      await value.ref.getDownloadURL().then((value) => {
            DPpath = value.toString(),
            _firebaseFirestore
                .collection('vendor')
                .doc(_auth.currentUser.uid.toString())
                .collection('shop')
                .doc('details')
                .update({
              '$docType': DPpath,
            }),
            _firebaseFirestore
                .collection('shopDocs')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .update({
              '$docType': DPpath,
            }),
            _firebaseFirestore
                .collection('shop')
                .doc(FirebaseAuth.instance.currentUser.uid)
                .update({
              '$docType': DPpath,
            }),
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            color: kPrimaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GST Certificate',
                    style: TextStyle(
                      color: kSecondaryLightColor,
                      fontSize: 18,
                    ),
                  ),
                  Divider(height: 2),
                  Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryLightColor,
                      ),
                      width: getProportionateScreenWidth(250),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            icon: Icons.camera_alt_outlined,
                            handler: () {},
                          ),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                uploadImages('GST Certificate');
                              }),
                        ],
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            color: kPrimaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop act Certificate (Gomasta)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Divider(height: 2),
                  Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryLightColor,
                      ),
                      width: getProportionateScreenWidth(250),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                              icon: Icons.camera_alt_outlined, handler: () {}),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                uploadImages('Act Certificate');
                              }),
                        ],
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            color: kPrimaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAN Card',
                    style: TextStyle(
                      color: kSecondaryLightColor,
                      fontSize: 18,
                    ),
                  ),
                  Divider(height: 2),
                  Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryLightColor,
                      ),
                      width: getProportionateScreenWidth(250),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                              icon: Icons.camera_alt_outlined, handler: () {}),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                uploadImages('PAN Card');
                              }),
                        ],
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            color: kPrimaryColor,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aadhar Card or Shop Electricity Bill',
                    style: TextStyle(
                      color: kSecondaryLightColor,
                      fontSize: 18,
                    ),
                  ),
                  Divider(height: 2),
                  Spacer(),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kPrimaryLightColor,
                      ),
                      width: getProportionateScreenWidth(250),
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                              icon: Icons.camera_alt_outlined, handler: () {}),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                uploadImages('Aadhar Card');
                              }),
                        ],
                      ),
                    ),
                  ),
                  Spacer()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}