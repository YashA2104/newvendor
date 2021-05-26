import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/RegisterPage/register_page.dart';

class BottomText extends StatelessWidget {
  const BottomText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Dont have an account?',
              style: TextStyle(
                  color: kPrimaryColor, fontFamily: 'Muli', fontSize: 12),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RegisterPage.routeName);
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                    color: kSecondaryColor,
                    fontFamily: 'Muli',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
