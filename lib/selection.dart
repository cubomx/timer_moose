import 'package:flutter/material.dart';
// widgets
import 'package:timer_moose/buttons_exercise_list.dart';
import 'package:timer_moose/effects/glow_circle.dart';

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [GlowCircle()],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: ButtonsExerciseList(),
            )
          ],
        ),
      ],
    );
  }
}
