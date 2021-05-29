
import 'package:flutter/material.dart';
import 'package:vendor/models/ChatMessage.dart';


class Message extends StatelessWidget {
  String msgText;
  bool isSender = false;

  Message({
    @required this.msgText,
    @required this.isSender,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context)
                .primaryColor
                .withOpacity(isSender ? 1 : 0.10),
            borderRadius: BorderRadius.circular(30),
          ),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            msgText,
            style: TextStyle(
              color: isSender ? Colors.white : Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
