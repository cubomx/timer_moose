import 'package:flutter/material.dart';
import 'package:timer_moose/buttons/my_button.dart';
import 'package:timer_moose/square_input.dart';
// routes
import 'package:timer_moose/routes/timers/main.dart';
// helpers
import 'package:timer_moose/helpers/convert.dart';
import 'package:timer_moose/helpers/navigation.dart';
import 'package:timer_moose/helpers/my_time.dart';

class Tabata extends StatefulWidget {
  final MaterialColor mainColor;
  const Tabata({required this.mainColor});
  @override
  _TabataState createState() => _TabataState();
}

List<Widget> getStarting(Function buttonAction, MaterialColor mainColor) {
  return <Widget>[
    SquareInput(
      colorNeon: mainColor,
      colorText: createMaterialColor(Colors.white),
      text: "ROUNDS",
      min: 1,
      max: 10,
      value: 8,
      fontSize: 40,
      steps: 1,
    ),
    SquareInput(
      colorNeon: mainColor,
      colorText: Colors.green,
      text: "WORK",
      min: 10,
      max: 120,
      value: 30,
      fontSize: 25,
      steps: 5,
    ),
    SquareInput(
      colorNeon: mainColor,
      colorText: Colors.red,
      text: "REST",
      min: 10,
      max: 30,
      value: 15,
      fontSize: 25,
      steps: 5,
    ),
    MyButton(
        text: "START",
        fontSize: 20.0,
        color: mainColor,
        actionButton: buttonAction,
        args: [],
        width: 200,
        height: 50),
  ];
}

class _TabataState extends State<Tabata> {
  int rounds = 0;
  late MyTime rest;
  late MyTime work;

  var items = <Widget>[];

  void getWorkoutSettings() {
    setState(() {
      if (items[0] is SquareInput) {
        rounds = (items[0] as SquareInput).value;
      }
      if (items[1] is SquareInput) {
        work = secondsToMinutes((items[1] as SquareInput).value);
      }
      if (items[2] is SquareInput) {
        rest = secondsToMinutes((items[2] as SquareInput).value);
      }
      switchScreen(
          context, TabataTimerRoute(rounds: rounds, rest: rest, work: work));
    });
  }

  @override
  void initState() {
    super.initState();
    items = getStarting(getWorkoutSettings, widget.mainColor);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items,
    );
  }
}
