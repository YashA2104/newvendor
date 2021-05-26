import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class feedbackTxtfld extends StatelessWidget {
  const feedbackTxtfld({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(50),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Feedback',
          hintText: 'Type your feedback Here',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: kPrimaryLightColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: kPrimaryLightColor,
            ),
          ),
          // suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.feedback)),
        ),
      ),
    );
  }
}
