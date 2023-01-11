import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }
}
