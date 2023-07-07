import 'package:flutter/cupertino.dart';

import '../models/flower.dart';
import 'card_miniflower.dart';

class RowFlowers extends StatefulWidget {
  final double cardSize;
  final List<Flower> flowers;

  const RowFlowers({super.key, required this.flowers, required this.cardSize});

  @override
  State<RowFlowers> createState() => _RowFlowersState();
}

class _RowFlowersState extends State<RowFlowers> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.flowers.map((flower) {
          return CardMiniFlower(
            flower: flower,
            imageSize: widget.cardSize * 0.9,
          );
        }).toList(),
      ),
    );
  }
}
