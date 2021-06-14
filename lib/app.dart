import 'package:flutter/material.dart';
// widgest
import 'my_app_bar.dart';
import 'buttons_exercise_list.dart';
import 'glow_circle.dart';
// helpers

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(key: Key("esta")),
        body: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [GlowCircle()],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: ButtonsExerciseList(),
                )
              ],
            ),
          ],
        ));
  }
}
