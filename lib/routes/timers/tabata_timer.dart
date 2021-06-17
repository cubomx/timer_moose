import 'package:flutter/material.dart';

class TabataTimer extends StatefulWidget {
  @override
  _TabataTimerState createState() => _TabataTimerState();
}

class _TabataTimerState extends State<TabataTimer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Tabata Timer",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
