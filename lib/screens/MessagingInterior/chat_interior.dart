
import 'package:flutter/material.dart';
import 'package:vendor/screens/CustomerProfile/customerprofile.dart';
import 'package:vendor/screens/MessagingChat/chat.dart';

import 'components/chat_interior_body.dart';

class ChatInterior extends StatelessWidget {
  static String routeName = '/ChatInterior';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.routeName);
              },
              icon: Icon(Icons.arrow_back_ios_outlined),
              color: Colors.black,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_2.png'),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, CustomerProfile.routeName);
                  },
                  child: Text(
                    'Budwar Shops',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                Text(
                  'Active 3m ago',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.location_on,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ChatInteriorBody(),
    );
  }
}
