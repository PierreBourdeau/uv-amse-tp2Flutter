import 'package:flutter/material.dart';
import 'Cell.dart';

class Grid extends StatelessWidget {
  var cells = [];
  var size;
  Function tapOnCell;
  double nbOfColumn;

  Grid(this.cells, this.size, this.tapOnCell, this.nbOfColumn);

  @override
  Widget build(BuildContext context) {
    var height = size.height;

    return Container(
      height: height * 0.60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: nbOfColumn.round(),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: nbOfColumn.round()*nbOfColumn.round(),
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