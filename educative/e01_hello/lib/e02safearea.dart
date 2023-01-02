import 'package:flutter/material.dart';

class WSafeArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(child: Text("Hello Flutter !")),
    );
  }
}