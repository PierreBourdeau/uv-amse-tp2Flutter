
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class exercice2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 2 '),
        backgroundColor: Colors.grey[850],
      ),
      body: MyStatefulWidget2(),
    );
  }
}

class exercice2StateFul extends State<MyStatefulWidget2> {

  double _sliderValue1 = 0;
  double _sliderValue2 = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.all(20),
              child : Transform(
                transform: Matrix4.rotationZ(_sliderValue1)..rotateX(_sliderValue2),
                child: Image.network('https://picsum.photos/512',fit: BoxFit.cover),
                ),
              ),
            Text("Rotation Z", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold ),),
            Slider(
                value: _sliderValue1,
                min: 0,
                max: 360,
                divisions: 8,
                label: _sliderValue1.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _sliderValue1 = value;
                  });
                }),
            Text("Rotation X", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold ),),
            Slider(
                value: _sliderValue2,
                min: 0,
                max: 360,
                divisions: 8,
                label: _sliderValue2.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _sliderValue2 = value;
                  });
                })
          ],
        )
    );
  }
}

class MyStatefulWidget2 extends StatefulWidget {
  @override
  exercice2StateFul createState() => exercice2StateFul();
}
