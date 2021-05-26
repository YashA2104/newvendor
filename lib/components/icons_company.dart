

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/constants.dart';

class IconsCompany extends StatelessWidget {
  final String inputSvg;
  IconsCompany({@required this.inputSvg});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(10),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: kPrimaryLightColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(inputSvg),
      ),
    );
  }
}
