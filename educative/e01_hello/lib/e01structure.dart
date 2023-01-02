import 'package:flutter/material.dart';

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context ) {
    return const MaterialApp(
      home: Center(
        child: Text("Hello Flutter!"),
      ),
    );
  }
}