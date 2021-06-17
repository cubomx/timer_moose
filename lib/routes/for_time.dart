import 'package:flutter/material.dart';

class ForTime extends StatefulWidget {
  @override
  _ForTimeState createState() => _ForTimeState();
}

class _ForTimeState extends State<ForTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Here goes for time",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ]),
    );
  }
}
