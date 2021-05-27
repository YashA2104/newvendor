import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor/components/default_button.dart';
import 'package:vendor/components/form_detail.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  CheckoutCard({
    Key key,
    @required this.text,
  }) : super(key: key);
  final String text;
  String couponCode;

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  TextEditingController couponCodeController = new TextEditingController();

  double percentage, _value = 3000;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(50),
        horizontal: getProportionateScreenWidth(50),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  child: TextField(
                    controller: couponCodeController,
                    decoration: InputDecoration(
                      hintText: 'Promo Code',
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: kPrimaryLightColor, width: 2.0),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                const SizedBox(width: 10),
                Container(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.save_outlined,
                          size: 30, color: kSecondaryColor),
                      onPressed: () {
                        setState(() {
                          var doc = FirebaseFirestore.instance.collection('couponCodes').doc().get().then((value) => {
                            value.data().forEach((key, value) {
                              if( key=='couponCode' && value== couponCodeController.text.toString()){
                                if(key == 'couponPercentage'){
                                  percentage = value;
                                  _value = _value - (percentage/100 * _value);
                                }
                              }
                            })
                          });
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: _value.toString(),
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // TextFormField(
                //   controller: couponCodeController,
                //   decoration: InputDecoration(
                //     labelText: 'Coupon Code',
                //     hintText: 'Enter Coupon Code',
                //     enabledBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide: BorderSide(
                //         color: Theme.of(context).accentColor,
                //       ),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide: BorderSide(
                //         color: Theme.of(context).primaryColor,
                //       ),
                //     ),
                //     suffixIcon: InkWell(
                //         onTap: () {},
                //         child: Icon(Icons.fiber_pin)),
                //   ),
                // ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: widget.text,
                    press: () async {
                      setState(() {
                        widget.couponCode =
                            couponCodeController.text.toString();
                      });
                      await FirebaseFirestore.instance
                          .collection('couponCodes')
                          .get()
                          .then((QuerySnapshot qs) => {
                                qs.docs.forEach((element) {
                                  print(widget.couponCode);
                                  if (element['couponCode'] ==
                                      widget.couponCode) {
                                    percentage = double.parse(
                                        element['couponPercentage']);
                                    setState(() {
                                      _value =
                                          _value - (percentage / 100 * _value);
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'Coupon Code Applied !');
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Coupon Code not applied !');
                                  }
                                })
                              });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
