import 'package:flutter/material.dart';
import 'Time.dart';
import 'ResetButton.dart';
import 'Move.dart';

class Menu extends StatelessWidget {

  Function reset;
  int taps;
  int seconds;
  var size;

  Menu(this.reset, this.taps, this.seconds, this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Move(taps),
          ResetButton(reset, "Reset"),
          Time(seconds),
        ],
      ),
    );
  }
}