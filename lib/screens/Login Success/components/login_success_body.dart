import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/home/home.dart';
import 'package:vendor/size_config.dart';

class LoginSuccessBody extends StatelessWidget {
  const LoginSuccessBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Image.asset(
              'assets/images/success.png',
              height: SizeConfig.screenHeight * 0.40,
              width: SizeConfig.screenWidth * 0.50,
            ),
            Text(
              'Login Success',
              style: TextStyle(
                fontFamily: 'Muli',
                fontSize: getProportionateScreenWidth(24),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Spacer(),
            SizedBox(
                width: SizeConfig.screenWidth * 0.6,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
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
                )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
