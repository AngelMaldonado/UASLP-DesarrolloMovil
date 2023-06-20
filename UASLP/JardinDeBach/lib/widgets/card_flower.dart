import 'package:flutter/material.dart';
import 'package:jardindebach/screens/flower_view.dart';
import 'package:jardindebach/utils/colors.dart';
import 'package:jardindebach/utils/constants.dart';
import '../models/flower.dart';

class CardFlower extends StatelessWidget {
  final Flower flower;

  const CardFlower({super.key, required this.flower});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FlowerView(flower: flower)),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            Ink.image(
              image: flower.image,
              height: MediaQuery.of(context).size.height / 4,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: mainPadding * 2),
              color: primary50opacity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    flower.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Chip(label: Text(flower.gives)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
