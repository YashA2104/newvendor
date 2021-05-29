import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
          child: StreamBuilder <QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('chattedUsers').doc(FirebaseAuth.instance.currentUser.uid).collection('users').snapshots(),
            builder: (context , snapshots){
              final List<DocumentSnapshot> documents = snapshots.data.docs;
              return documents.isNotEmpty? ListView(
                children: documents.map((doc)  =>
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatInterior(id:doc['userID'] ,name:doc['userName'],address: doc['address'],phone: doc['phoneNumber'],)));
                        },
                        child: chatWidget(name: doc['userName'],id: doc['userID'], ))).toList(),
              ) : Center(child: CircularProgressIndicator());
            },
          )
        )
      ],
    );
  }
}
