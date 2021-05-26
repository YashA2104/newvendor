
import 'package:flutter/material.dart';
import 'package:vendor/models/ChatMessage.dart';


class Message extends StatelessWidget {
  final ChatMessage message;

  Message({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender)
          CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage('assets/images/user_2.png'),
          ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor
                .withOpacity(message.isSender ? 1 : 0.10),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isSender ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
