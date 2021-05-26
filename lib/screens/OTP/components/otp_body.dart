import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/OTP/components/otp_form.dart';
import 'package:vendor/screens/OTP/components/otp_timer.dart';
import 'package:vendor/screens/OTP/components/resend_otp.dart';
import 'package:vendor/screens/RegisterSuccess/register_success.dart';
import 'package:vendor/size_config.dart';

class OTPBody extends StatelessWidget {
  const OTPBody({Key key}) : super(key: key);

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
              'Please Verify through OTP',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'We sent your code to +91 7410712747',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(12),
                color: kPrimaryColor,
              ),
            ),
            OTPTimer(),
            SizedBox(height: getProportionateScreenHeight(100)),
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Center(
                  child: Row(
                    children: [
                      OTPForm(),
                      SizedBox(
                        width: getProportionateScreenWidth(16),
                      ),
                      OTPForm(),
                      SizedBox(
                        width: getProportionateScreenWidth(16),
                      ),
                      OTPForm(),
                      SizedBox(
                        width: getProportionateScreenWidth(16),
                      ),
                      OTPForm(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(250)),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterSuccess.routeName);
                },
                color: kSecondaryColor,
                child: Text('Continue',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kPrimaryColor,
                    )),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50)),
            ResendOTP(),
            SizedBox(
              height: getProportionateScreenHeight(25),
            ),
          ],
        ),
      ),
    );
  }
}
