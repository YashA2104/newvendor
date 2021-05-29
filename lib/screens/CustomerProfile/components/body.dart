
import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/CustomerProfile/components/CustomerDetails.dart';
import 'package:vendor/screens/CustomerProfile/components/profilepic.dart';
import 'package:vendor/size_config.dart';

class Body extends StatelessWidget {
  String name,phone,address;
  Body({
    @required this.phone,
    @required this.address,
    @required this.name,
    print(name, phone , address),
});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenWidth(10),),
        ProfilePicCustomer(),
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
        Text(
          name,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        CustomerDetails(
            text: phone, icon: "assets/icons/User Icon.svg"),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        CustomerDetails(text: address, icon: "assets/icons/User Icon.svg"),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        CustomerDetails(
            text: 'Report Customer', icon: "assets/icons/User Icon.svg"),
        SizedBox(
          height: getProportionateScreenWidth(5),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(20)),
          child: Container(
            transform: Matrix4.translationValues(0, 20, 1),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getProportionateScreenWidth(15)),
                    topRight:
                        Radius.circular(getProportionateScreenWidth(15)))),
            height: getProportionateScreenWidth(150),
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
