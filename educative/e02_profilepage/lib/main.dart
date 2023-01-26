import 'package:flutter/material.dart';
import 'package:e02_profilepage/widgets.dart';
import 'package:e02_profilepage/themes.dart';

void main() => runApp(ContactProfilePage());

enum APP_THEME { LIGHT, DARK }

class ContactProfilePage extends StatefulWidget {
  @override
  _ContactProfilePageState createState() => _ContactProfilePageState();
}

class _ContactProfilePageState extends State<ContactProfilePage> {
  var currentTheme = APP_THEME.LIGHT;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme == APP_THEME.DARK
          ? MyAppThemes.appThemeDark()
          : MyAppThemes.appThemeLight(),
      home: Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print("Contact is starred!");
              },
              icon: const Icon(Icons.star_border),
            ),
          ],
        ),
        body: buildBodyWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: IconButton(
            icon: const Icon(Icons.threesixty),
            onPressed: () {
              setState(() {
                currentTheme == APP_THEME.DARK
                    ? currentTheme = APP_THEME.LIGHT
                    : currentTheme = APP_THEME.DARK;
              });
            },
          ),
        ),
      ),
    );
  }
}
