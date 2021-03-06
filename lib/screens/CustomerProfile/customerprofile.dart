
import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, FontWeight, Icon, IconButton, Icons, Navigator, Scaffold, StatelessWidget, Text, TextStyle, Widget, required;
import 'package:vendor/screens/CustomerProfile/components/body.dart';
import 'package:vendor/screens/MessagingInterior/chat_interior.dart';
import 'package:vendor/size_config.dart';

class CustomerProfile extends StatelessWidget {
  String name,phone,address;
  CustomerProfile({
    @required this.name,
    @required this.phone,
    @required this.address,
});
  static String routeName = '/CustomerProfile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ChatInterior.routeName);
          },
        ),
        elevation: 0,
        title: Text(
          'Customer Profile',
          style: TextStyle(
            fontFamily: 'Muli',
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Body(address: address,phone: phone,name: name,),
    );
  }
}
