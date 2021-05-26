import 'package:flutter/material.dart';

class PaySubBTn extends StatelessWidget {
  const PaySubBTn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 50,
    width: double.infinity,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      onPressed: () {},
      color: Theme.of(context).primaryColor,
      child: Text(
        'Pay for Subscription',
          style: TextStyle(
            fontFamily: 'Muli',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          )),
    ),
    );
  }
}