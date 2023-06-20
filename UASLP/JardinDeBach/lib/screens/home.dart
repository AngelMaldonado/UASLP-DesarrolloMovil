import 'package:flutter/material.dart';
import 'package:jardindebach/screens/diagnose.dart';
import 'package:jardindebach/screens/diagnose_history.dart';
import 'package:jardindebach/screens/flowers_list.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  final int tabIndex;

  const Home({super.key, required this.tabIndex});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FlowersList(),
    Diagnose(),
    DiagnoseHistory()
  ];

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.tabIndex;
  }

  void setTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: _widgetOptions.elementAt(_selectedTab),
      bottomNavigationBar: AppBottomNavigationBar(
        changeIndex: setTab,
        selectedIndex: _selectedTab,
      ),
    );
  }
}
