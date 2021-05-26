import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/screens/Catalogue%20Images/catalogue_images.dart';
import 'package:faker/faker.dart';
import 'package:vendor/screens/Photo%20Options/components/box_options.dart';
import 'package:vendor/screens/Shop%20Images/shop_images.dart';

import 'package:vendor/size_config.dart';

class PhotoOptionsBody extends StatefulWidget {

  @override
  _PhotoOptionsBodyState createState() => _PhotoOptionsBodyState();
}

class _PhotoOptionsBodyState extends State<PhotoOptionsBody> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String shopImageURL;
  final picker = ImagePicker();
  File image ;

  Future  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null)
      {
        image = File(pickedFile.path);
        uploadImages();
      }
    });
  }
  uploadImages() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var storage =FirebaseStorage.instance.ref('ShopImages').child(faker.person.name());
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null ).then((value) async{
      await value.ref.getDownloadURL().then((value) => {
        shopImageURL=value.toString(),
        firebaseFirestore.collection('shopImages').doc(firebaseAuth.currentUser.uid.toString()).collection('images').doc().set(
            {
             'imageURL' : shopImageURL,
              'docID' : FirebaseAuth.instance.currentUser.uid,
            }).whenComplete(() => {
          Fluttertoast.showToast(msg: 'ImageDetails Saved!'),
        }),
        firebaseFirestore.collection('shop').doc(firebaseAuth.currentUser.uid.toString()).update(
            {
              'shopImageURL' : shopImageURL,
            }),

      });
    });
  }

  Future  chooseImage1() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if(pickedFile!=null)
      {
        image = File(pickedFile.path);
        uploadImages1();
      }
    });
  }
  uploadImages1() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var storage =FirebaseStorage.instance.ref('CatImages').child(faker.person.name());
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null ).then((value) async{
      await value.ref.getDownloadURL().then((value) => {
        shopImageURL=value.toString(),
        firebaseFirestore.collection('catalogueImages').doc(firebaseAuth.currentUser.uid.toString()).collection('images').doc().set(
            {
              'imageURL' : shopImageURL,
              'docID' : firebaseAuth.currentUser.uid,
            }).whenComplete(() => {
          Fluttertoast.showToast(msg: 'ImageDetails Saved!'),
        }),
        firebaseFirestore.collection('shop').doc(firebaseAuth.currentUser.uid.toString()).update(
            {
              'catImageURL' : shopImageURL,
            }),

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              chooseImage();
            },
            child: BoxOption(
              title: '-Shop Images-',
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          GestureDetector(
            onTap: () {
              chooseImage1();
            },
            child: BoxOption(
              title: '-Catalogue Images-',
            ),
          )
        ],
      ),
    );
  }
}

