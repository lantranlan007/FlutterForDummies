import 'package:flutter/material.dart';

void main() => runApp(App0900());

class App0900 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = getAnimation(controller!);
  }


  Animation<double> getAnimation(AnimationController controller) {
    Tween<double> tween = Tween<double>(begin: 100.0, end: 500.0);
    Animation<double> animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    return animation;
  }

  Widget buildPositionedWidget() {
    return Positioned(
      left: 150.0,
      top: animation?.value,
      child: Icon(
        Icons.music_note,
        size: 70.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    buildPositionedWidget(),
                  ],
                ),
              ),
              buildRowOfButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRowOfButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () => controller?.forward(),
          child: Text('Forward'),
        ),
        SizedBox(
          width: 8.0,
        ),
        RaisedButton(
          onPressed: () => controller?.animateBack(0.0),
          child: Text('Backward'),
        ),
        SizedBox(
          width: 8.0,
        ),
        RaisedButton(
          onPressed: () => controller?.reset(),
          child: Text('Reset'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}