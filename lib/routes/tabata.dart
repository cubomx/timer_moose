import 'package:flutter/material.dart';
import 'package:timer_moose/effects/flicker_circle.dart';
// BUTTON
import '../button_back.dart';

class Tabata extends StatefulWidget {
  @override
  _TabataState createState() => _TabataState();
}

var goBack = () => {};

class _TabataState extends State<Tabata> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ButtonBack(),
        FlickerCircle(
          color: Colors.blue,
          strokeWidth: 3,
          child: Container(
            margin: EdgeInsets.only(top: 0),
            child: Text(
              "12",
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
          ),
          key: Key("esta no es"),
          shadowSpread: 3,
          spreadValue: 3,
        ),
      ],
    );
  }
}
