import 'package:flutter/material.dart';
import 'package:jardindebach/utils/colors.dart';

import '../utils/constants.dart';

class EmotionCard extends StatelessWidget {
  final AssetImage image;
  final String legend;

  const EmotionCard({super.key, required this.legend, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(mainPadding),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: mainPadding),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(mainPadding),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(legend, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
