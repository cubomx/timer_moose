import 'package:flutter/material.dart';
// helpers
//import 'helpers/convert.dart';
import 'package:flutter_glow/flutter_glow.dart';

class ButtonExercise extends StatefulWidget {
  final String title;
  final MaterialColor color;
  const ButtonExercise(this.title, this.color);
  @override
  _ButtonExerciseState createState() => _ButtonExerciseState();
}

class _ButtonExerciseState extends State<ButtonExercise> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200, height: 50),
      child: ElevatedButton(
        onPressed: () {},
        child: GlowText(
          widget.title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
