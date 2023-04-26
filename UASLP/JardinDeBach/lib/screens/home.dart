import 'package:flutter/material.dart';
import 'package:jardindebach/screens/flowers.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreen = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Flowers(),
  ];
  void changeScreen(int index) {
    setState(() {
      _selectedScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(appName)),
        body: _widgetOptions.elementAt(_selectedScreen),
        bottomNavigationBar: AppBottomNavigationBar(
          changeIndex: changeScreen,
          selectedIndex: _selectedScreen,
        ));
  }
}
