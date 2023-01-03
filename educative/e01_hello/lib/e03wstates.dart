import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WStates extends StatefulWidget {
  @override
  _WStatesState createState() => _WStatesState();
}

String englishGreeting = "Hello Flutter !";
String spanishGreeting = "Hola Flutter !";

class _WStatesState extends State<WStates> {
  String displayText = englishGreeting;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hide debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Flutter App"),
          leading: const Icon(Icons.home),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    displayText = displayText == englishGreeting
                        ? spanishGreeting
                        : englishGreeting;
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child: Text(
            displayText,
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
