import 'package:flutter/material.dart';
import 'package:timer_moose/routes/main.dart';
// widgets
import 'package:timer_moose/button_exercise.dart';
// helpers
import 'package:timer_moose/helpers/convert.dart';

Function switchScreen = (context, route) =>
    {Navigator.push(context, MaterialPageRoute(builder: (context) => route))};

class ButtonsExerciseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "TABATA",
                createMaterialColor(Color(0xffe05848)),
                switchScreen,
                [context, TabataRoute()])),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "AMRAP",
                createMaterialColor(Color(0xff19e2fe)),
                switchScreen,
                [context, AmrapRoute()])),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "FOR TIME",
                createMaterialColor(Color(0xffefb607)),
                switchScreen,
                [context, ForTimeRoute()])),
        Padding(
            padding: EdgeInsets.all(4.0),
            child: ButtonExercise(
                "EMOM",
                createMaterialColor(Color(0xff9bd62e)),
                switchScreen,
                [context, EmomRoute()])),
      ],
    );
  }
}
