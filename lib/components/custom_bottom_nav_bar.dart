import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor/screens/MessagingChat/chat.dart';
import 'package:vendor/screens/Shop_Profile/shop_profile.dart';
import 'package:vendor/screens/enums.dart';
import 'package:vendor/screens/home/home.dart';
import 'package:vendor/size_config.dart';
import '../constants.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = kSecondaryLightColor;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          // BoxShadow(
          //   offset: Offset(0, -15),
          //   blurRadius: 20,
          //   color: Color(0xFFDADADA).withOpacity(0.15),
          // ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(getProportionateScreenWidth(30)),
          topRight: Radius.circular(getProportionateScreenWidth(30)),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu
                      ? kSecondaryColor
                      : inActiveIconColor,
                ),
                onPressed: () =>
                    Navigator.pushNamed(context, HomeScreen.routeName),
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: MenuState.message == selectedMenu
                      ? kSecondaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ChatScreen.routeName);
                },
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? kSecondaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ShopProfile.routeName);
                },
              ),
            ],
          )),
    );
  }
}
