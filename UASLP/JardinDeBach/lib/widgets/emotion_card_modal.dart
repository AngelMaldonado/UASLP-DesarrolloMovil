import 'package:flutter/material.dart';

import '../models/flower.dart';
import '../utils/colors.dart';

class EmotionCardModal extends StatefulWidget {
  final Map<Flower, bool> selections;
  final void Function() onSelectionClick;
  final void Function(Flower) notifyParent;

  const EmotionCardModal({
    super.key,
    required this.onSelectionClick,
    required this.selections,
    required this.notifyParent,
  });

  @override
  State<EmotionCardModal> createState() => _EmotionCardModalState();
}

class _EmotionCardModalState extends State<EmotionCardModal> {
  void toggleCheckBox(Flower flower) {
    setState(() {
      widget.onSelectionClick();
      widget.notifyParent(flower);
      widget.selections.update(flower, (checked) => checked ? false : true);
    });
  }

  List<Widget> dialogOptions() {
    return widget.selections.keys.map((Flower flower) {
      return CheckboxListTile(
        title: Text(flower.phrase),
        value: widget.selections[flower],
        activeColor: primary100,
        checkColor: Colors.white,
        onChanged: (_) => toggleCheckBox(flower),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Dialog(
          child: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: Column(
              children: dialogOptions(),
            ),
          ),
        );
      },
    );
  }
}
