import 'package:flutter/material.dart';

main() => runApp(App0306());

class App0306 extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Adding Widgets"),
        ),
        body: Column(children: [
          Text(
            "Hello world!",
            textScaleFactor: 2.0,
          ),
          Text("It's lonely for me inside this phone.")
        ]),
      ),
    );
  }
}
