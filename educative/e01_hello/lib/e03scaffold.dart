import 'package:flutter/material.dart';

class WScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugShowCheckedModeBanner: false
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter App"),
          leading: Icon(Icons.home),
          actions: <Widget>[
            IconButton(onPressed: (){}, icon: Icon(Icons.refresh))
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