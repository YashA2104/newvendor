import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/MyShop/myshop.dart';
import 'package:vendor/screens/home/components/containertwo.dart';
import 'package:vendor/screens/home/components/homecontainer.dart';
import 'package:vendor/size_config.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Body extends StatefulWidget {
  String imageURL;
  Body({
    @required this.imageURL,
});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String shopImageURL, catImageURL;

  getDocs() async {
    DocumentSnapshot doc1 = await FirebaseFirestore.instance
        .collection('vendor')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('user').doc('details').get();
    shopImageURL = doc1['shopImage'];
    catImageURL = doc1['catImage'];
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getDocs();
    });
    return ListView(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () async {
                  FirebaseFirestore fs = await FirebaseFirestore.instance;
                  String id =
                  FirebaseAuth.instance.currentUser.uid.toString();
                  DocumentSnapshot doc = await fs
                      .collection('vendor')
                      .doc(id)
                      .collection('shop')
                      .doc('details')
                      .get();
                  DocumentSnapshot doc1 =
                  await fs.collection('shop').doc(id).get();
                  shopImageURL = doc1['shopImageURL'];
                  catImageURL = doc1['catImageURL'];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyShop(
                                catImageURL: doc1['catImageURL'],
                                shopImageURL: doc1['shopImageURL'],
                                uid:
                                FirebaseAuth.instance.currentUser.uid,
                                shopName: doc['shopName'],
                                shopAddress: doc['shopAddress'],
                                shopType: doc['shopType'],
                              )));
                },
                child: InkWell(
                  onTap: ()async{
                    var doc = await FirebaseFirestore.instance.collection('vendor').doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('user').doc('details').get();
                    var shopimageURL = doc['shopImage'];
                    var catimageURL = doc['catImage'];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyShop(shopType: doc['shopType'], shopName: doc['shopName'], catImageURL: catimageURL, shopImageURL: shopimageURL,shopAddress: doc['address'],uid: doc['userID'],)));
                  },
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(13),
                            vertical: getProportionateScreenWidth(13)),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(15)),
                          height: getProportionateScreenHeight(250),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(15))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(15),
                                top: getProportionateScreenWidth(15)),
                            child: Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(15)),
                          child: Image.network(
                            widget.imageURL,
                            width: getProportionateScreenWidth(200),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -15,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(43)),
                          child: Text(
                            'My Shop',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                '------Your Dashboard------',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenWidth(18),
                    color: Colors.black),
              ),
              HomeContainer(
                text: 'Weekly Sales',
                press: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16.9)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ContainerTwo(
                      text: 'Today\'s Earnings:',
                      press: () {},
                      color: kSecondaryColor,
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(12),
                    ),
                    ContainerTwo(
                      text: 'Your Orders',
                      press: () {},
                      color: kPrimaryLightColor,
                    ),
                  ],
                ),
              ),
              HomeContainer(text: 'Your Progress', press: () {}),
            ],
          )
        ]);
  }
}
