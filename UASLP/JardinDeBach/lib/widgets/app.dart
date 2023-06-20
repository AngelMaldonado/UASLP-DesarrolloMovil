import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/utils/themes.dart';
import 'package:jardindebach/screens/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: Themes.appThemeLight(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(tabIndex: 0),
        '/flowers': (context) => const Home(tabIndex: 0),
        '/diagnose': (context) => const Home(tabIndex: 1),
        '/history': (context) => const Home(tabIndex: 2),
      },
    );
  }
}
