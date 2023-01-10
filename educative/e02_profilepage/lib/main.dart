import 'package:flutter/material.dart';
import 'package:e02_profilepage/widgets.dart';

void main() => runApp(ContactProfilePage());

class ContactProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.indigo,
        ),
      ),
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
