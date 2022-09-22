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
    return Tween<double>(begin: 50.0, end: 250.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  Widget buildPositionedWidget() {
    int? intValue = animation?.value?.toInt();
    return Center(
      child: Icon(
        Icons.child_care,
        size: animation?.value,
        color: Color.fromRGBO(
          intValue!,
          0,
          255 - intValue,
          1.0,
        ),
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
