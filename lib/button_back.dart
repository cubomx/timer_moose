import 'package:flutter/material.dart';
// style
import 'package:flutter_glow/flutter_glow.dart';

var goBack = (context) => {Navigator.pop(context)};

class ButtonBack extends StatefulWidget {
  @override
  _ButtonBackState createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 200, height: 50),
      child: ElevatedButton(
        onPressed: () {
          goBack(context);
        },
        child: GlowText(
          "BACK",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          onSurface: Colors.grey,
        ),
      ),
    );
  }
}
