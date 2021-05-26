
import 'package:flutter/material.dart';
import 'package:vendor/models/Chat.dart';
import 'package:vendor/screens/MessagingInterior/chat_interior.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, ChatInterior.routeName);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(chatsData[index].image),
                        ),
                        if (chatsData[index].isActive == true)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              chatsData[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              chatsData[index].lastMessage,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.50)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0.80,
                      child: Text(
                        chatsData[index].time,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
