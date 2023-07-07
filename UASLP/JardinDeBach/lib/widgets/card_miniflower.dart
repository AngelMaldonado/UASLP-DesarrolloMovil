import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';

import '../models/flower.dart';
import '../screens/flower_view.dart';

class CardMiniFlower extends StatelessWidget {
  final double imageSize;
  final Flower flower;

  const CardMiniFlower({
    super.key,
    required this.flower,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FlowerView(flower: flower)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/img/${flower.name}.jpg',
                width: imageSize,
                height: imageSize,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              flower.name,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.black, backgroundColor: Colors.transparent),
            ),
          ],
        ),
      ),
    );
  }
}
