import 'package:flutter/material.dart';
// BUTTON
import '../button_back.dart';

class Tabata extends StatefulWidget {
  @override
  _TabataState createState() => _TabataState();
}

var goBack = () => {};

class _TabataState extends State<Tabata> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[ButtonBack()],
    );
  }
}
