import 'package:flutter/material.dart';
import 'package:jardindebach/widgets/emotion_card_modal.dart';

import '../models/flower.dart';
import '../utils/constants.dart';

class EmotionCard extends StatefulWidget {
  final AssetImage image;
  final String legend;
  final List<Flower> flowers;
  final int Function(Flower) onSelectionClick;

  const EmotionCard(
      {super.key,
      required this.legend,
      required this.image,
      required this.flowers,
      required this.onSelectionClick});

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  int _selectedModalOptions = 0;

  void modalOptionToggle(Flower option) {
    setState(() => _selectedModalOptions = widget.onSelectionClick(option));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return EmotionCardModal(
                flowers: widget.flowers,
                onSelectionClick: modalOptionToggle,
              );
            });
      },
      child: Container(
        padding: const EdgeInsets.all(mainPadding),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.image,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(mainPadding),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(widget.legend, textAlign: TextAlign.center),
            ),
            Visibility(
              visible: _selectedModalOptions > 0 ? true : false,
              child: Align(
                alignment: Alignment.topRight,
                child: Chip(label: Text('$_selectedModalOptions')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
