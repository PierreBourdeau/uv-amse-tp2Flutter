import 'dart:async';
import 'package:flutter/material.dart';
import 'components/GameUI.dart';
import 'components/GameTitle.dart';
import 'components/Grid.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  int taps = 0;
  double _currentSliderValue = 4;
  var cells = new List <int>.generate(16, (index) => index);


  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    cells.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        startTime();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Jeu Taquin'),
        backgroundColor: Colors.grey[850],
      ),
        body: SafeArea(
          child: Container(
            height: size.height,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                GameTitle(size),
                Grid(cells, size, tapOnCell, _currentSliderValue),
                Menu(reset, taps, secondsPassed, size),
                Slider(
                    value: _currentSliderValue,
                    min: 3,
                    max : 6,
                    divisions: 3,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                        cells = new List<int>.generate(_currentSliderValue.round()*_currentSliderValue.round(), (index) => index);
                        reset();
                      });
                    })
              ],
            ),
          ),
        ),
    );
  }

  void tapOnCell(index) {
    if (secondsPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && cells[index - 1] == 0 && index % _currentSliderValue.round() != 0 ||
        index + 1 < (_currentSliderValue.round()*_currentSliderValue.round()) && cells[index + 1] == 0 && (index + 1) % _currentSliderValue.round() != 0 ||
        (index - _currentSliderValue.round() >= 0 && cells[index - _currentSliderValue.round()] == 0) ||
        (index + _currentSliderValue.round() < _currentSliderValue.round()*_currentSliderValue.round() && cells[index + _currentSliderValue.round()] == 0)) {
      setState(() {
        taps++;
        cells[cells.indexOf(0)] = cells[index];
        cells[index] = 0;
      });
    }
    checkIfWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  void reset() {
    setState(() {
      cells.shuffle();
      taps = 0;
      secondsPassed = 0;
      isActive = false;
    });
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkIfWin() {
    if (isSorted(cells)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You Win!!",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 220.0,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}