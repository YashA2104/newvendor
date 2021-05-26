import 'package:flutter/material.dart';
import 'package:vendor/components/icons_company.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisplayCompanyIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(242, 216, 237, 1),
              shape: BoxShape.circle,
            ),
            child: Image.asset('assets/icons/instagram2.png'),
          ),
        ),
        // IconsCompany(inputSvg: 'assets/icons/google-icon.svg'),
        SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(165, 188, 235, 1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/facebook-2.svg'),
          ),
        ),
        // IconsCompany(inputSvg: 'assets/icons/facebook-2.svg'),
        SizedBox(
          width: 7,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(201, 215, 248, 1),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset('assets/icons/twitter.svg'),
          ),
        ),
        // IconsCompany(inputSvg: 'assets/icons/twitter.svg'),
        SizedBox(
          width: 7,
        ),
      ],
    );
  }
}
