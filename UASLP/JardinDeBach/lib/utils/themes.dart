import 'package:flutter/material.dart';
import 'colors.dart';

class Themes {
  static ThemeData appThemeLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: primary100,
        inversePrimary: primary10,
        secondary: primary50,
        tertiary: highlight,
        background: primary50,
        onBackground: primary50,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.normal,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: Colors.blue),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primary50,
      ),
    );
  }
}
