import 'package:flutter/material.dart';
// helpers
import 'package:flutter_glow/flutter_glow.dart';

class ButtonExercise extends StatefulWidget {
  final String title;
  final MaterialColor color;
  final Function onPress;
  final List args;
  const ButtonExercise(this.title, this.color, this.onPress, this.args);
  @override
  _ButtonExerciseState createState() => _ButtonExerciseState();
}

class _ButtonExerciseState extends State<ButtonExercise> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200, height: 50),
      child: ElevatedButton(
        onPressed: () {
          Function.apply(widget.onPress, widget.args);
        },
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
