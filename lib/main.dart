import 'package:flutter/material.dart';
import 'package:flutter_app/exercice2.dart';
import 'package:flutter_app/exercice4.dart';
import 'package:flutter_app/exercice1.dart';
import 'package:flutter_app/exercice5.dart';
import 'package:flutter_app/exercice5part2.dart';
import 'package:flutter_app/exercice6part2.dart';
import 'package:flutter_app/exercice6.dart';
import 'package:flutter_app/exercice3.dart';
import 'package:flutter_app/jeuTaquin.dart';

final Exercices = [exercice1(),exercice2(), exercice3(), exercice4(), exercice5(),exercice5part2(),exercice6(), exercice6part2(), Game(),];
final nomsExercices = ["Exercice 1 - Afficher une image", "Exercice 2 - Transformer une image", "Exercice 3 - Menu", "Exercice 4 - Affichage d'une tuile", "Exercice 5 - Génération d'un plateau de tuiles", "Exercice 5 - Partie 2", "Exercice 6 - Animation d'une tuile", "Exercice 6 - Partie 2", "Jeu Taquin"];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'TP2 - Taquin';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super (key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  static Widget _widgetOptions = ListView.builder(itemBuilder: (context, index) {
    return Card (
      child: ListTile(
        onTap:(){
          Navigator.of(context)
              .push(
              MaterialPageRoute(
                  builder: (context) => Exercices[index]
              )
          );
        },
        title: Text('${nomsExercices[index]}'),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey[850],),
      ),
    );
  },
    itemCount: Exercices.length,
    padding: const EdgeInsets.all(8),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP2 - Jeu Taquin'),
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: _widgetOptions
      ),
    );
  }
}