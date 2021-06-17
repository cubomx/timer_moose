import 'package:flutter/material.dart';
import 'package:timer_moose/buttons/my_button.dart';
import 'package:timer_moose/my_app_bar.dart';
import 'package:timer_moose/square_input.dart';
// helpers
import 'package:timer_moose/helpers/convert.dart';
import 'package:timer_moose/helpers/navigation.dart';

class Tabata extends StatefulWidget {
  @override
  _TabataState createState() => _TabataState();
}

List<Widget> getStarting(Function buttonAction) {
  return <Widget>[
    SquareInput(
      colorNeon: Colors.purple,
      colorText: createMaterialColor(Colors.white),
      text: "ROUNDS",
      min: 1,
      max: 10,
      value: 8,
      fontSize: 40,
      steps: 1,
    ),
    SquareInput(
      colorNeon: Colors.purple,
      colorText: Colors.green,
      text: "WORK",
      min: 10,
      max: 120,
      value: 30,
      fontSize: 25,
      steps: 5,
    ),
    SquareInput(
      colorNeon: Colors.purple,
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
        color: Colors.purple,
        actionButton: buttonAction,
        args: [],
        width: 200,
        height: 50),
  ];
}

class _TabataState extends State<Tabata> {
  int rounds = 0;
  int rest = 0;
  int work = 0;

  var items = <Widget>[];

  void getWorkoutSettings() {
    setState(() {
      if (items[0] is SquareInput) {
        rounds = (items[0] as SquareInput).value;
      }
      if (items[1] is SquareInput) {
        work = (items[1] as SquareInput).value;
      }
      if (items[2] is SquareInput) {
        rest = (items[2] as SquareInput).value;
      }
      switchScreen(
          context, TabataTimerRoute(rounds: rounds, rest: rest, work: work));
    });
  }

  @override
  void initState() {
    super.initState();
    items = getStarting(getWorkoutSettings);
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

class TabataTimerRoute extends StatelessWidget {
  final int rounds, rest, work;
  const TabataTimerRoute(
      {required this.rounds, required this.rest, required this.work});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        key: Key("Tabata Timer Route"),
        screenTitle: "TABATA",
        leftAction: goBack,
        leftArgs: [context],
        leftIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: Text(
        rounds.toString(),
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
