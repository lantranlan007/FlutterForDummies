import 'package:flutter/material.dart';

void main() => runApp(App0101());

class App0101 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Center(
          child: RaisedButton(
            onPressed: () => print("I've been clicked."),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Click Me"),
            ),
          ),
        ),
      ),
    );
  }
}
