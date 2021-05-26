import 'package:flutter/material.dart';
import 'package:vendor/models/ChatMessage.dart';
import 'package:vendor/screens/MessagingInterior/components/message.dart';

class ChatInteriorBody extends StatelessWidget {
  const ChatInteriorBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Message(
                  message: demeChatMessages[index],
                ),
              ),
              itemCount: demeChatMessages.length,
            ),
          ),
        ),
        bottomMenu(context),
      ],
    );
  }

  Container bottomMenu(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.payment_rounded,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Icon(Icons.sentiment_satisfied_alt, color: Colors.white),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Type Message',
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
