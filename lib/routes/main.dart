import 'package:flutter/material.dart';
// widgets
import 'package:timer_moose/my_app_bar.dart';
import 'package:timer_moose/routes/amrap.dart';
import 'package:timer_moose/routes/for_time.dart';
import 'package:timer_moose/routes/tabata.dart';
import 'package:timer_moose/routes/emom.dart';
// helpers
import 'package:timer_moose/helpers/navigation.dart';
import 'package:timer_moose/helpers/convert.dart';

class TabataRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        key: Key("Tabata"),
        screenTitle: "TABATA",
        leftAction: goBack,
        leftArgs: [context],
        leftIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: Tabata(
          mainColor: createMaterialColor(
        Color(0xffe05848),
      )),
    );
  }
}

class AmrapRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        key: Key("Amrap"),
        screenTitle: "AMRAP",
        leftAction: goBack,
        leftArgs: [context],
        leftIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: Amrap(),
    );
  }
}

class ForTimeRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        key: Key("For time"),
        screenTitle: "FOR TIME",
        leftAction: goBack,
        leftArgs: [context],
        leftIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: ForTime(),
    );
  }
}

class EmomRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        key: Key("Emom"),
        screenTitle: "EMOM",
        leftAction: goBack,
        leftArgs: [context],
        leftIcon: Icons.arrow_back_ios_new_rounded,
      ),
      body: Emom(),
    );
  }
}
