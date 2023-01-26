import 'package:flutter/material.dart';

class MyAppThemes {
  static ThemeData appThemeLight() {
    return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Colors.orange),
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
