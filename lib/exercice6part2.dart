import 'package:flutter/material.dart';
import 'components/Cell.dart';

class exercice6part2 extends StatefulWidget {
  @override
  _exercice6part2State createState() => _exercice6part2State();
}

class _exercice6part2State extends State<exercice6part2> {
  double _currentSliderValue = 4;
  var cells = new List <int>.generate(16, (index) => index);


  @override
  void initState() {
    super.initState();
    cells.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 6 Partie 2'),
        backgroundColor: Colors.grey[850],
      ),
      body: SafeArea(
        child: Container(
          height: size.height,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              GridExercice6(cells, size, tapOnCell),
            ],
          ),
        ),
      ),
    );
  }

  void tapOnCell(index) {
    if (index - 1 >= 0 && cells[index - 1] == 0 &&
        index % _currentSliderValue.round() != 0 ||
        index + 1 <
            (_currentSliderValue.round() * _currentSliderValue.round()) &&
            cells[index + 1] == 0 &&
            (index + 1) % _currentSliderValue.round() != 0 ||
        (index - _currentSliderValue.round() >= 0 &&
            cells[index - _currentSliderValue.round()] == 0) ||
        (index + _currentSliderValue.round() <
            _currentSliderValue.round() * _currentSliderValue.round() &&
            cells[index + _currentSliderValue.round()] == 0)) {
      setState(() {
        cells[cells.indexOf(0)] = cells[index];
        cells[index] = 0;
      });
    }
  }
}

class GridExercice6 extends StatelessWidget {
  var cells = [];
  var size;
  Function tapOnCell;

  GridExercice6(this.cells, this.size, this.tapOnCell);

  @override
  Widget build(BuildContext context) {
    var height = size.height;

    return Container(
      height: height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: cells.length,
          itemBuilder: (context, index) {
            return cells[index] != 0
                ? Cell("${cells[index]}", () {
              tapOnCell(index);
            })
                : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
