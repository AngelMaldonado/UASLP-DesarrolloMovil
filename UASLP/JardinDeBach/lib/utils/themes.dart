import 'package:flutter/material.dart';
import 'colors.dart';

class Themes {
  static ThemeData appThemeLight() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: primary100,
        secondary: secondary,
        tertiary: highlight,
      ),
      appBarTheme: const AppBarTheme(),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 28, color: Colors.white),
        headlineMedium: TextStyle(fontSize: 20, color: Colors.white),
        headlineSmall: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primary100,
        selectedItemColor: Colors.white,
        unselectedItemColor: primary10,
      ),
      chipTheme: const ChipThemeData(
        backgroundColor: primary5,
        labelStyle: TextStyle(color: primary100),
      ),
    );
  }
}
