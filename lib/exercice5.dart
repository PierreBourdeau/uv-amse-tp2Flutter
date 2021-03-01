import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();


  Color randomColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }



class exercice5 extends StatelessWidget {

  Widget coloredBox() {
    return Container(
      color: randomColor(),
      child: Padding(
        padding: EdgeInsets.all(70.0),
      )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5 '),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          children: List.generate(9, (index) {
            return coloredBox();
          })
        )
      ),
    );
  }
}
