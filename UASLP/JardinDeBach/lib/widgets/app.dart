import 'package:flutter/material.dart';
import 'package:jardindebach/screens/onboarding.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/utils/themes.dart';
import 'package:jardindebach/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences prefs;

  const App({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: MaterialApp(
        title: appName,
        theme: Themes.appThemeLight(),
        initialRoute: prefs.getInt('onBoarding') != 0 ? '/onboarding' : '/',
        routes: {
          '/': (context) => const Home(tabIndex: 0),
          '/onboarding': (context) => const OnBoarding(),
          '/flowers': (context) => const Home(tabIndex: 0),
          '/diagnose': (context) => const Home(tabIndex: 1),
          '/history': (context) => const Home(tabIndex: 2),
        },
      ),
    );
  }
}
