import 'package:flutter/material.dart';
// widgets
import 'button_exercise.dart';
// helpers
import 'helpers/convert.dart';

class ButtonsExerciseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "TABATA", createMaterialColor(Color(0xffe05848)))),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "AMRAP", createMaterialColor(Color(0xff19e2fe)))),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "FOR TIME", createMaterialColor(Color(0xffefb607)))),
        Padding(
            padding: EdgeInsets.all(4.0),
            child:
                ButtonExercise("EMOM", createMaterialColor(Color(0xff9bd62e)))),
      ],
    );
  }
}
