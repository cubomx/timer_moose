import 'package:flutter/material.dart';
// widgets
import 'my_app_bar.dart';
import 'selection.dart';
import 'routes/tabata.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(key: Key("esta")), body: Selection());
  }
}

class TabataRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(key: Key("esta")),
      body: Tabata(),
    );
  }
}
