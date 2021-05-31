import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// 1. This method refreshes itself everytime we hit save
//
// 1. The dice image overflows because image is quite large
// 2. We use the Expanded class to solve this
// 3. Exapnded would take as much horizontal space as it can
// 4. We can modify how much space it should take
// 5. flex lets you modify the space that a widget should take

// 1. You can go to Flutter outline to add widgets or to wrap
//    around for example a Row around center
// 2. The option that comes up with the bulb could come up by
//    pressing Alt + Enter key

// 1. Use a flat Button
// 2. Button expects a void callback
// 3. Print statment can be used to debug

// 1. Build method gets reload when hot reload
// 2. Where we create our varibales, where we declare it, matters a lot

// Dart - Statically typed language
// dynamic data type which can take all the data types values
// Recommendation - Avoid using dynamic and var
// Make type safe variables
//
// Stateless widget and Stateful widget
// 1. State of the stateless widget is not meant to change
// 2. If you want the state to change, best to use Stateful widget
// class DicePage extends StatelessWidget

// 1. shortcut to create a stateful widget - stful
class DicePage extends StatefulWidget {
  const DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

// 1. It is mutable
// 2. setState = would trigger a rebuild
//    find what has changed
// 3. setState marks the variable that has changed and then
//    rebuilds the tree and show the change
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Image.asset('images/dice$rightDiceNumber.png'),
                onPressed: () {
                  changeDiceFace();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeDiceFace() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
