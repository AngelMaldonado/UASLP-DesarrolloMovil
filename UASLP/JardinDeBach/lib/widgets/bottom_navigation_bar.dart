import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Function(int) changeIndex;
  final int selectedIndex;
  const AppBottomNavigationBar({
    super.key,
    required this.changeIndex,
    required this.selectedIndex,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.flower),
          label: 'Flores',
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.bottleTonic),
          label: 'Diagnosticar',
        ),
        BottomNavigationBarItem(
          icon: Icon(MdiIcons.history),
          label: 'Historial',
        ),
      ],
      currentIndex: widget.selectedIndex,
      onTap: widget.changeIndex,
    );
  }
}
