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
  String shopName, shopType,shopAddress,uid,shopImageURL,catImageURL;
  Body({
    @required this.uid,
    @required this.shopType,
    @required this.shopName,
    @required this.shopAddress,
    @required this.shopImageURL,
    @required this.catImageURL,
});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String shopImageURL,catImageURL;

  getDocs() async{
    DocumentSnapshot doc1 = await FirebaseFirestore.instance.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).get();
    shopImageURL = doc1['shopImageURL'];
    catImageURL = doc1['catImageURL'];
  }
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
      var firebaseAuth;
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
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onLoading() async {
    setState(() {
      getDocs();
    });
    _refreshController.loadComplete();
  }
  String valueChoose;

  List listItems = ['1', '2', '3'];

  @override
  Widget build(BuildContext context) {
    setState(() {
      getDocs();
    });
    return SmartRefresher(
      controller: _refreshController,
      onLoading: _onLoading,
      enablePullDown: true,
      onRefresh: () async {
        await Future.delayed(Duration(milliseconds: 1000));
        _refreshController.refreshCompleted();
        print(shopImageURL + 'shopImageURL');
      },
      scrollDirection: Axis.vertical,
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShopImage(
                shopImageURL: widget.shopImageURL,
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
                      fs.collection('vendor').doc(FirebaseAuth.instance.currentUser.uid.toString()).collection('shop').doc('details').update({
                        'DeliveryTiming'  : newValue,
                      }).whenComplete(() => {
                        Fluttertoast.showToast(msg: 'Delivery Timings Saved !'),
                      });
                      fs.collection('shop').doc(FirebaseAuth.instance.currentUser.uid.toString()).update({
                        'deliveryHours' : newValue,
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
                catImageURL: widget.catImageURL,
                text: '-Catalogue-',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
