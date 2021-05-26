import 'package:flutter/material.dart';
import 'package:vendor/constants.dart';

class OrderDetails extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String date;

  OrderDetails({
    @required this.icon,
    @required this.title,
    @required this.description,
    @required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
            child: Icon(
              icon,
              color: kSecondaryLightColor,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor),
                  overflow: TextOverflow.clip,
                ),
                Text(
                  description,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: kPrimaryColor, fontFamily: 'Muli'),
                ),
                Text(
                  date,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: kPrimaryColor, fontFamily: 'Muli'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
