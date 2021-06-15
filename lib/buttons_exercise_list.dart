import 'package:flutter/material.dart';
import 'package:timer_moose/app.dart';
// widgets
import 'button_exercise.dart';
// helpers
import 'helpers/convert.dart';

var switchScreen = (context) => {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TabataRoute()))
    };

class ButtonsExerciseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise("TABATA",
                createMaterialColor(Color(0xffe05848)), switchScreen)),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "AMRAP", createMaterialColor(Color(0xff19e2fe)), switchScreen)),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise("FOR TIME",
                createMaterialColor(Color(0xffefb607)), switchScreen)),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "EMOM", createMaterialColor(Color(0xff9bd62e)), switchScreen)),
      ],
    );
  }
}
