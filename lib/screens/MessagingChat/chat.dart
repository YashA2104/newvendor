
import 'package:flutter/material.dart';
import 'package:vendor/components/custom_bottom_nav_bar.dart';
import 'package:vendor/screens/MessagingChat/components/chat_body.dart';
import 'package:vendor/screens/enums.dart';
import 'package:vendor/size_config.dart';


class ChatScreen extends StatelessWidget {
  static String routeName = "/Chat";
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
            
          },
        ),
        elevation: 0,
        title: Text(
          'Chat',
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
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ChatBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}
