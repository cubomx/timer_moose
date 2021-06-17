import 'package:flutter/material.dart';
// style
import 'package:flutter_glow/flutter_glow.dart';

class MyButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final double width, height;
  final MaterialColor color;
  final Function actionButton;
  final List args;
  const MyButton(
      {required this.text,
      required this.fontSize,
      required this.color,
      required this.actionButton,
      required this.args,
      required this.width,
      required this.height});
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(width: widget.width, height: widget.height),
      child: ElevatedButton(
        onPressed: () {
          Function.apply(widget.actionButton, widget.args);
        },
        child: GlowText(
          widget.text,
          style:
              TextStyle(fontSize: widget.fontSize, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: widget.color,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
