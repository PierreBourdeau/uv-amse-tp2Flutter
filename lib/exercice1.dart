import 'package:flutter/material.dart';

class exercice1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 1 '),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Image.network('https://picsum.photos/512'),
        ),
      );
  }
}