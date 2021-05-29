import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vendor/models/ChatMessage.dart';
import 'package:vendor/screens/MessagingInterior/components/message.dart';

class ChatInteriorBody extends StatelessWidget {
  ScrollController scrollController =ScrollController();
  String name,id,phone,address;
  ChatInteriorBody({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.address,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages').orderBy('timeStamp').snapshots(),
              builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  );
                }
                else{
                  List<DocumentSnapshot> docs = snapshot.data.docs;
                  List<Widget> messages = docs.where((element) =>
                  ((element['senderID'] == FirebaseAuth.instance.currentUser.uid &&
                      element['receiverID'] ==  id) ||
                      (element['receiverID'] == FirebaseAuth.instance.currentUser.uid &&
                          element['senderID'] == id)),
                  ).map((doc)=> Message(
                    isSender: FirebaseAuth.instance.currentUser.uid == doc['senderID'],
                    msgText: doc['messageBody'],
                  )).toList();

                  return ListView(
                    controller: scrollController,
                    children: messages,
                  );
                }


              }),
        ),
        bottomMenu(context , id),
      ],
    );
  }

  Container bottomMenu(BuildContext context, String id) {
    TextEditingController messageController = new TextEditingController();
    Future<void> sendChat() async {
      if (messageController.text.length > 0) {
        await FirebaseFirestore.instance.collection("messages").add({
          'senderID': FirebaseAuth.instance.currentUser.uid,
          'receiverID': id,
          'messageBody': messageController.text,
          'timeStamp': FieldValue.serverTimestamp(),
          'isImage' : false,
        });
        messageController.clear();
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      }
      else{
        Fluttertoast.showToast(msg: 'Kindly Enter a Message');
      }

    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        child: Row(
          children: [
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
                        controller: messageController,
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
            ),
            IconButton(
              icon: Icon(Icons.send_rounded,),
              onPressed: (){
                print(id);
                sendChat();
              },
            ),
          ],
        ),
      ),
    );
  }
}
