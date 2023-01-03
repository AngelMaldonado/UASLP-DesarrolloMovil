import 'package:flutter/material.dart';

class WScaffold extends StatelessWidget {
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
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: const Center(
          child: Text(
            "Hello Flutter !",
            style: TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }
}
