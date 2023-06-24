import 'package:flutter/material.dart';
import 'package:jardindebach/widgets/emotion_card_modal.dart';

import '../models/flower.dart';
import '../utils/constants.dart';

class EmotionCard extends StatefulWidget {
  final AssetImage image;
  final String legend;
  final void Function(Flower) notifyParent;
  final Map<Flower, bool> selections;

  const EmotionCard({
    super.key,
    required this.legend,
    required this.image,
    required this.selections,
    required this.notifyParent,
  });

  @override
  State<EmotionCard> createState() => _EmotionCardState();
}

class _EmotionCardState extends State<EmotionCard> {
  int countSelectedCardOptions() {
    return widget.selections.values.where((check) => check == true).length;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return EmotionCardModal(
                  selections: widget.selections,
                  notifyParent: widget.notifyParent,
                  onSelectionClick: () {
                    setState(() {});
                  });
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
              visible: countSelectedCardOptions() > 0 ? true : false,
              child: Align(
                alignment: Alignment.topRight,
                child: Chip(label: Text('${countSelectedCardOptions()}')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
