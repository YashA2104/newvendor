import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Feedback/components/feedbackbtn.dart';
import 'package:vendor/screens/Feedback/components/feedbacktextfld.dart';
import 'package:vendor/size_config.dart';

class FeedbackBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenWidth(50),
          ),
          Text(
            'Kart-Ex',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '--For Buisness--',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          ),
          Text(
            'We are new in business, Your valuable feedback would be really helpful',
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(
            height: getProportionateScreenWidth(35),
          ),
          SizedBox(
            height: getProportionateScreenWidth(40),
          ),
          feedbackTxtfld(),
          SizedBox(
            height: getProportionateScreenWidth(150),
          ),
          feedbackbtn()
        ],
      ),
    );
  }
}
