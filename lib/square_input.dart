import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
// widgets
import 'package:timer_moose/effects/square_neon.dart';

class SquareInput extends StatefulWidget {
  final MaterialColor colorNeon, colorText;
  final String text;
  final double fontSize;
  final double min, max, value;
  const SquareInput(
      {required this.colorNeon,
      required this.colorText,
      required this.text,
      required this.fontSize,
      required this.min,
      required this.max,
      required this.value});
  @override
  _SquareInputState createState() => _SquareInputState();
}

class _SquareInputState extends State<SquareInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
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
                widget.value.toStringAsFixed(0),
                style:
                    TextStyle(color: Colors.white, fontSize: widget.fontSize),
              ),
            ),
          ),
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
