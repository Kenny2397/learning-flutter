import 'package:flutter/material.dart';

class AppTheme {
  final List<MaterialColor> themes = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.amber,
    Colors.brown,
    Colors.cyan,
    Colors.deepPurple,
    Colors.indigo,
    Colors.lime,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.grey,
    Colors.blueGrey,
  ];

  ThemeData getTheme(int theme) {
    return ThemeData(
      // primarySwatch: themes[theme],
      colorSchemeSeed: themes[theme],
      useMaterial3: true,
    );
  }
}
