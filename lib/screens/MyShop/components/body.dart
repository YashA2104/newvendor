import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:vendor/screens/MyShop/components/catalogueImage.dart';
import 'package:vendor/screens/MyShop/components/shopimage.dart';
import 'package:vendor/size_config.dart';

class Body extends StatefulWidget {
  String shopName, shopType,shopAddress,uid,shopImage,catImage;
  Body({
    @required this.uid,
    @required this.shopType,
    @required this.shopName,
    @required this.shopAddress,
    @required this.shopImage,
    @required this.catImage,
});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String shopImageURL,catImageURL;

  final picker = ImagePicker();
  File image ;

  String valueChoose;

  List listItems = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopImage(
                shopImageURL: widget.shopImage,
                text: '-Shop Images-',
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)),
                child: Text(
                  widget.shopName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(20),
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(2),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)),
                child: Row(
                  children: [
                    Text(
                      widget.shopType,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(35),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35),
                    ),
                child: Text(
                  widget.shopAddress,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black),
                ),
              ),
               SizedBox(
                width: getProportionateScreenWidth(35),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35),
                    ),
                child: Text(
                  'Set your Delivery Hours:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)),
                child: DropdownButton(
                  hint: Text('Time'),
                  dropdownColor: Colors.white,
                  icon: Icon(
                    Icons.arrow_drop_down,
                  ),
                  isExpanded: true,
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                      FirebaseFirestore fs = FirebaseFirestore.instance;
                      fs.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).update(
                          {
                            'deliveryTiming' : newValue,
                          });
                      fs.collection('vendor').doc(FirebaseAuth.instance.currentUser.uid.toString()).collection('user').doc('details').update({
                        'DeliveryTiming'  : newValue,
                      }).whenComplete(() => {
                        Fluttertoast.showToast(msg: 'Delivery Timings Saved !'),
                      });
                    });
                  },
                  items: listItems.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(35),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35)),
                child: Text(
                  'Upload your Catalogue Here:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(15),
                      color: Colors.black),
                ),
              ),
              catImage(
                catImageURL: widget.catImage,
                text: '-Catalogue-',
              ),
            ],
          ),
        ],
      );
  }
}
