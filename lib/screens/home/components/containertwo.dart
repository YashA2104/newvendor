import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/size_config.dart';

class ContainerTwo extends StatelessWidget {
  const ContainerTwo({
    Key key,
    @required this.text,
    @required this.press,
    @required this.color,
  }) : super(key: key);
  final Color color;
  final String text;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getProportionateScreenWidth(164),
        width: getProportionateScreenWidth(164),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(15))),
        child: Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(18),
              top: getProportionateScreenWidth(15)),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
