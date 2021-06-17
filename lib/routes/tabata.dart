import 'package:flutter/material.dart';
import 'package:timer_moose/helpers/convert.dart';
import 'package:timer_moose/square_input.dart';
import 'package:flutter_glow/flutter_glow.dart';

class Tabata extends StatefulWidget {
  @override
  _TabataState createState() => _TabataState();
}

var goBack = () => {};

class _TabataState extends State<Tabata> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //ButtonBack(),
        SquareInput(
          colorNeon: Colors.purple,
          colorText: createMaterialColor(Colors.white),
          text: "ROUNDS",
          min: 1,
          max: 10,
          value: 8,
          fontSize: 40,
        ),
        SquareInput(
          colorNeon: Colors.purple,
          colorText: Colors.green,
          text: "WORK",
          min: 10,
          max: 120,
          value: 30,
          fontSize: 25,
        ),
        SquareInput(
          colorNeon: Colors.purple,
          colorText: Colors.red,
          text: "REST",
          min: 10,
          max: 30,
          value: 15,
          fontSize: 25,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 200, height: 50),
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                onSurface: Colors.grey,
              ),
              child: GlowText(
                "START",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
        ),
      ],
    );
  }
}
