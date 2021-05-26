import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String inputText;

  Button({
    @required this.inputText,
  });
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
        child: Text(inputText,
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
