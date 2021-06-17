import 'package:flutter/material.dart';

Function switchScreen = (context, route) =>
    {Navigator.push(context, MaterialPageRoute(builder: (context) => route))};

Function goBack = (context) => {Navigator.pop(context)};
