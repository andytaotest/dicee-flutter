import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 5;
  int rightDiceNumber = 5;

  void chgNum(){
    // setState() will mark the variable 'leftDiceNumber' in build()
    // and change the value at other instances when triggered (onPressed)
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      print('Left button number: $leftDiceNumber');
      print('Right button number: $rightDiceNumber');
    });
  }

  @override
  Widget build(BuildContext context) { // hot reload will run everything in build()
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: chgNum,
              child: Image.asset('images/dice$leftDiceNumber.png'), // String interpolation
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: (){
                chgNum();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}

