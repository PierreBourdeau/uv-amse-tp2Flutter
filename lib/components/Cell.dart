import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  Function click;
  String number;

  Cell(this.number, this.click);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
        number,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      color: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(8.0),
      ),
      onPressed: click,
    );
  }
}