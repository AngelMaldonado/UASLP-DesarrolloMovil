import 'package:flutter/material.dart';
import 'package:e02_profilepage/widgets.dart';
import 'package:e02_profilepage/themes.dart';

void main() => runApp(ContactProfilePage());

class ContactProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyAppThemes.appThemeLight(),
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
      ),
    );
  }
}
