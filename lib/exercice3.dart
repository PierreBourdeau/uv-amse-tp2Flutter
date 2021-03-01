import 'package:flutter/material.dart';

class exercice3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 3 '),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
            child: Column(
                children: <Widget>[
                  Icon(Icons.check, size: 60, color: Colors.green,),
                  Text("The list to display the exercices",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ]
            )
        )
      ),
    );
  }
}