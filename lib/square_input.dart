import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:timer_moose/buttons/button_change.dart';
// widgets
import 'package:timer_moose/effects/square_neon.dart';

// ignore: must_be_immutable
class SquareInput extends StatefulWidget {
  final MaterialColor colorNeon, colorText;
  final String text;
  final double fontSize;
  int value;
  final int min, max, steps;
  SquareInput(
      {required this.colorNeon,
      required this.colorText,
      required this.text,
      required this.fontSize,
      required this.min,
      required this.max,
      required this.value,
      required this.steps});
  @override
  _SquareInputState createState() => _SquareInputState();
}

class _SquareInputState extends State<SquareInput> {
  void changeValue(int itIncreases) {
    setState(() {
      widget.value += widget.steps * itIncreases;
      if (widget.value > widget.max) {
        widget.value = widget.max;
      } else if (widget.value < widget.min) {
        widget.value = widget.min;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
          child: SquareNeon(
            color: widget.colorNeon,
            strokeWidth: 3,
            shadowSpread: 3,
            spreadValue: 3,
            key: Key("esta no es"),
            height: 100,
            width: 100,
            child: Container(
              margin: EdgeInsets.only(top: 0),
              child: Text(
                widget.value.toString(),
                style:
                    TextStyle(color: Colors.white, fontSize: widget.fontSize),
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            ButtonChange(
              args: [1],
              changeAction: changeValue,
              iconColor: widget.colorText,
              icon: Icons.add,
            ),
            ButtonChange(
              args: [-1],
              changeAction: changeValue,
              iconColor: widget.colorText,
              icon: Icons.remove,
            ),
          ],
        ),
        Padding(
            padding: EdgeInsets.all(10),
            child: GlowText(
              widget.text,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: widget.colorText),
            )),
      ],
    );
  }
}
