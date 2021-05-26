import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/RegisterPage/components/display_company_icons.dart';
import 'package:vendor/screens/RegisterPage/components/form.dart';
import 'package:vendor/size_config.dart';

class RegisterPageBody extends StatelessWidget {
  const RegisterPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              'Register Account',
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
              'Complete your details or continue \nwith social media',
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
            FormPage(),
            SizedBox(
              height: getProportionateScreenWidth(70),
            ),
            DisplayCompanyIcons(),
            SizedBox(height: getProportionateScreenWidth(20)),
            InkWell(
              onTap: () {},
              child: Text(
                'By continuing you confirm that you agree \nwith the term and conditions',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: getProportionateScreenWidth(12),
                  color: kPrimaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
