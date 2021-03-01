import 'package:flutter/material.dart';

Tile tile = new Tile(
    imageURL: 'https://picsum.photos/512');
final int numberOfLines = 3;

class exercice5part2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice 5 part. 2 '),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: numberOfLines, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) => createTileWidgetFrom(tile), itemCount: numberOfLines*numberOfLines,)
      ),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
class Tile {
  String imageURL;

  Tile({this.imageURL});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: FractionalOffset(0,0),
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}
