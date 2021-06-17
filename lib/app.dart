import 'package:flutter/material.dart';
// widgets
import 'package:timer_moose/my_app_bar.dart';
import 'package:timer_moose/selection.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          key: Key("esta"),
          screenTitle: "TIMER MOOSE",
          leftAction: () {},
          leftArgs: [],
          leftIcon: Icons.menu,
        ),
        body: Selection());
  }
}
