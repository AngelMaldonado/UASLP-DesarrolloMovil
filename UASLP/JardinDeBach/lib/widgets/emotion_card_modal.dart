import 'package:flutter/material.dart';

import '../models/flower.dart';

class EmotionCardModal extends StatefulWidget {
  final List<Flower> flowers;
  final Function(Flower) onSelectionClick;

  const EmotionCardModal({
    super.key,
    required this.flowers,
    required this.onSelectionClick,
  });

  @override
  State<EmotionCardModal> createState() => _EmotionCardModalState();
}

class _EmotionCardModalState extends State<EmotionCardModal> {
  Map<Flower, bool> _selections = {};
  bool check = false;

  void toggleCheckBox() {
    setState(() => check ? false : true);
  }

  List<Widget> generateDialogOptions() {
    List<Widget> options = <Widget>[];
    _selections.keys.forEach((flower) {
      options.add(CheckboxListTile(
        title: Text(flower.phrase),
        value: _selections[flower],
        onChanged: (bool? value) => setState(() {
          _selections[flower] = value!;
        }),
      ));
    });
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        _selections = {for (var flower in widget.flowers) flower: false};
        return Dialog(
          child: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Column(
                children: _selections.keys.map((Flower key) {
              return CheckboxListTile(
                title: Text(key.phrase),
                value: _selections[key],
                activeColor: Colors.pink,
                checkColor: Colors.white,
                onChanged: (bool? value) {
                  setState(() {
                    print(_selections[key]);
                    _selections[key] = true;
                  });
                },
              );
            }).toList()),
          ),
        );
      },
    );
  }
}
