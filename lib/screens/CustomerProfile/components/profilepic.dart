import 'package:flutter/material.dart';

class ProfilePicCustomer extends StatelessWidget {
  const ProfilePicCustomer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile Image.png"),
          ),
          
        ],
      ),
    );
  }
}