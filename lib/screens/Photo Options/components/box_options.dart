import 'package:flutter/material.dart';
import 'package:vendor/size_config.dart';

class BoxOption extends StatelessWidget {
  final String title;
  BoxOption({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenWidth(15)),
      child: Container(
        height: 250,
        padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(15),
          ),
        ),
        child: Center(
          child: Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white)),
        ),
      ),
    );
  }
}
