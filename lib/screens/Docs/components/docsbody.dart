import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

import 'buttons.dart';

class DocsBody extends StatefulWidget {

  String email,pass;
  DocsBody({
    @required this.email,
    @required this.pass,
});
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
  Future chooseCameraImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  uploadDocs(String docType) async {
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
                .collection('user')
                .doc('details')
                .update({
              '$docType': DPpath,
            }).whenComplete(() => {
              _firebaseFirestore.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).update({
                '$docType': DPpath,
              }),
              Fluttertoast.showToast(msg: '$docType is uploaded Successfully !!'),
            }),
          });
    });
  }

  uploadImages(String doc) async{
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
          .collection('user')
          .doc('details')
          .update({
      '$doc': DPpath,
      }),
      });
    });

  }

  void uploadshopImage() async{
    await _firebaseFirestore
        .collection('vendor')
        .doc(_auth.currentUser.uid.toString())
        .collection('shopImages')
        .doc()
        .set({
      'shopImage': DPpath,
    }).whenComplete(() => Fluttertoast.showToast(msg: 'shopImage Uploaded Successfully'));
  }
  void uploadcatImage() async{
    await _firebaseFirestore
        .collection('vendor')
        .doc(_auth.currentUser.uid.toString())
        .collection('catImages')
        .doc()
        .set({
      'catImage': DPpath,
    }).whenComplete(() => Fluttertoast.showToast(msg: 'catImage Uploaded Successfully'));
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
                            handler: () {
                              chooseCameraImage();
                              uploadDocs('GST Certificate');
                            },
                          ),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadDocs('GST Certificate');
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
                              icon: Icons.camera_alt_outlined, handler: () {
                                chooseCameraImage();
                                uploadDocs('Act Certificate');
                          }),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadDocs('Act Certificate');
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
                              icon: Icons.camera_alt_outlined, handler: () {
                                chooseCameraImage();
                                uploadDocs('PAN Card');
                          }),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadDocs('PAN Card');
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
                              icon: Icons.camera_alt_outlined, handler: () {
                              chooseCameraImage();
                              uploadDocs('Aadhar Card');

                          }),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadDocs('Aadhar Card');
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
                    'Shop Image',
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
                              icon: Icons.camera_alt_outlined, handler: () {
                                chooseCameraImage();
                            uploadshopImage();
                            uploadImages('shopImage');

                          }),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadshopImage();
                                uploadImages('shopImage');
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
                    'Catalogue Image',
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
                              icon: Icons.camera_alt_outlined, handler: () {
                                chooseCameraImage();
                                uploadDocs('catImage');
                                uploadcatImage();
                          }),
                          SizedBox(width: getProportionateScreenWidth(30)),
                          Button(
                              icon: Icons.file_upload,
                              handler: () {
                                chooseImage();
                                uploadcatImage();
                                uploadImages('catImage');
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
        ],
      ),
    );
  }
}
