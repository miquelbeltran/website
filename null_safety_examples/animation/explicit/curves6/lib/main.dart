import 'dart:async';
import 'package:flutter/material.dart';

class BouncingBallDemo extends StatefulWidget {
  @override
  _BouncingBallDemoState createState() => _BouncingBallDemoState();
}

class _BouncingBallDemoState extends State<BouncingBallDemo>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.bounceOut,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: curvedAnimation.value * 200),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 40.0,
        height: 40.0,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: BouncingBallDemo(),
        ),
      ),
    );
  }
}

Future<void> main() async {
  runApp(
    MyApp(),
  );
}
