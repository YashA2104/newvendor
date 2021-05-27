import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor/screens/MyShop/components/shopimage.dart';
import 'package:vendor/screens/ShopStatus/components/ShopStatusCont.dart';
import 'package:vendor/screens/ShopStatus/components/check_out_card.dart';
import 'package:vendor/screens/ShopStatus/components/paysubbtn.dart';
import 'package:vendor/size_config.dart';

class Body extends StatefulWidget {

  String shopStatus;
  Body({
    @required this.shopStatus,
});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String couponCode;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(

        children: [
          SizedBox(height: getProportionateScreenWidth(5),),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(23)),
            child: Row(
              children: [

                Text(
                  'Groceries',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          ShopStatusCont(
            text: widget.shopStatus == 'Verified' ? 'Shop Status - "LIVE"' :'Shop Status - "NOT LIVE"' ,
          ),
          Subscription(),
          CheckoutCard(text: 'Subscribe',),
        ],
      ),
      ],

    );
  }
}

class Subscription extends StatelessWidget {
  const Subscription({
    Key key,
  }) : super(key: key);

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
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(15),
              top: getProportionateScreenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'Subscription',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    'Current Plan:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(15),
                  ),
                  Text(
                    '₹3000',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(50),
              ),
              Row(
                children: [
                  Text(
                    'Payment Due Date:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Text(
                    'dd/mm/yyyy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
