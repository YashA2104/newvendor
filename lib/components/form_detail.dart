import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class FormDetails extends StatelessWidget {
  final String labelText;
  final String hint;

  final TextEditingController controller;

  FormDetails({
    @required this.labelText,
    @required this.hint,
    @required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(50),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: kPrimaryColor),
          labelText: labelText,
          hintText: hint,
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
        ),
      ),
    );
  }
}
