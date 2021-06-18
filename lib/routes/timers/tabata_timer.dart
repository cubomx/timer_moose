import 'package:flutter/material.dart';
// widgets
import 'package:timer_moose/effects/circle_neon.dart';

class TabataTimer extends StatefulWidget {
  @override
  _TabataTimerState createState() => _TabataTimerState();
}

class _TabataTimerState extends State<TabataTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleNeon(
        child: Text("Timer"),
        color: Colors.white,
        key: Key("Circle Neon Tabata"),
        radius: 150,
        shadowSpread: 3,
        spreadValue: 3,
        strokeWidth: 3,
        time: 60,
      ),
    );
  }
}
