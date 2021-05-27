import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Complete%20Profile/components/complete_profile_form.dart';
import 'package:vendor/size_config.dart';

class CompleteProfileBody extends StatelessWidget {
  String email,pass;
  CompleteProfileBody({
    @required this.email,
    @required this.pass,
});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Complete Profile',
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(24),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            'Please fill in your shop details to continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Muli',
              fontSize: getProportionateScreenWidth(12),
              color: kPrimaryColor,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          CompleteProfileForm(email: email, pass: pass,),
          InkWell(
            onTap: () {},
            child: Text(
              'By continuing you confirm that you agree \nwith the Term and Conditions',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(12),
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(15),
          )
        ],
      ),
    );
  }
}
