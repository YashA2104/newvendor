import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';

class UploadButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: kSecondaryColor,
        child: Text('Upload Your Document',
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kPrimaryColor,
            )),
      ),
    );
  }
}
