import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShopImage extends StatefulWidget {
  @override
  _ShopImageState createState() => _ShopImageState();
  final String text, shopImageURL;
  ShopImage({
    @required this.text,
    @required this.shopImageURL,
  });
}

class _ShopImageState extends State<ShopImage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String shopImageURL;
  final picker = ImagePicker();
  File image;

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        uploadImages();
      }
    });
  }

  uploadImages() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var storage =
        FirebaseStorage.instance.ref('ShopImages').child(faker.person.name());
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null).then((value) async {
      await value.ref.getDownloadURL().then((value) => {
            shopImageURL = value.toString(),
            firebaseFirestore
                .collection('shopImages')
                .doc(firebaseAuth.currentUser.uid.toString())
                .collection('images')
                .doc()
                .set({
              'imageURL': shopImageURL,
              'docID': FirebaseAuth.instance.currentUser.uid,
            }).whenComplete(() => {
                      Fluttertoast.showToast(msg: 'ImageDetails Saved!'),
                    }),
            firebaseFirestore
                .collection('shop')
                .doc(firebaseAuth.currentUser.uid.toString())
                .update({
              'shopImageURL': shopImageURL,
            }),
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenWidth(15)),
      child: Container(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        height: getProportionateScreenHeight(220),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15))),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: widget.shopImageURL == ''
                  ? Container(
                      child: Image.asset('assets/images/splash_2.png'),
                    )
                  : Image.network(widget.shopImageURL),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(15),
                  top: getProportionateScreenWidth(15)),
              child: Text(
                widget.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            Positioned(
              right: -12,
              bottom: -12,
              child: SizedBox(
                height: 56,
                width: 56,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Color(0xFFF5F6F9),
                  onPressed: () {
                    chooseImage();
                    uploadImages();
                  },
                  child: SvgPicture.asset(
                    "assets/icons/Camera Icon.svg",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
