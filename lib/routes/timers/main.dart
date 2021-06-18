import 'package:flutter/material.dart';
// widgets
import 'package:timer_moose/my_app_bar.dart';
import 'package:timer_moose/routes/timers/tabata_timer.dart';
// helpers
import 'package:timer_moose/helpers/navigation.dart';

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
      body: TabataTimer(),
    );
  }
}
