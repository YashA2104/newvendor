import 'package:flutter/material.dart';
import 'package:vendor/screens/MessagingInterior/chat_interior.dart';

class chatWidget extends StatelessWidget {
  bool isActive =false;
  String name,id;
  chatWidget({
    @required this.name,
    @required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatInterior(name: name,id: id,)));
        print(id);
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
                  backgroundImage: NetworkImage('https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg'),
                ),
                if (isActive == true)
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
                      name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hi',
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
                'today',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
