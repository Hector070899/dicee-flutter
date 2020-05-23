import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dicee',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: DicePage(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.autorenew),
          backgroundColor: Colors.blueGrey,
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  void sorting() {
    //funcion que sortea de manera random los numeros de los dados

    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) +
          1; // como el rango es entre 0 - 5, el +1 permite que nucan caiga 0 y llegue hasta 6
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                sorting();
              },
              child: Image.asset(
                  'images/dice$leftDiceNumber.png'), //se sustituye el valor del dice por un $leftDiceNumber para obtener el valor de random
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  sorting();
                });
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
