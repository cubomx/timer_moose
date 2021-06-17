import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// widgets
import 'package:timer_moose/app.dart';
// helpers
import 'package:timer_moose/helpers/convert.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
        fontFamily: "Lastica",
        primarySwatch: createMaterialColor(Colors.black),
      ),
      home: App(),
    );
  }
}
