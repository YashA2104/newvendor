import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
            child: Text(
              'Your Activity',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
          ),
          // FlatButton(
          //   onPressed: () {},
          //   child: Text('See More',
          //       style: TextStyle(
          //         fontFamily: 'Muli',
          //         fontSize: getProportionateScreenWidth(16),
          //         fontWeight: FontWeight.bold,
          //         color: kPrimaryColor,
          //       )),
          // )
        ],
      ),
    );
  }
}
