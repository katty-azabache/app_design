import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  Animation<double> animation;
  AnimationController controller;

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1000));
    Tween tween = new Tween<double>(begin: 0.0, end: 10.0);
    animation = tween.animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: Center(
        child: ScaleTransition(
          scale: controller,
          child: Container(
            width: 130.0,
            child: Icon(Icons.ac_unit)
          ),
        ),
      ),
    );
  }
}
