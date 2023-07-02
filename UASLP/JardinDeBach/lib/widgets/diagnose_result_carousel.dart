import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jardindebach/widgets/card_flower_for_diagnose.dart';

import '../models/flower.dart';

class DiagnoseResultCarousel extends StatefulWidget {
  final List<Flower> selections;
  final void Function(Flower) notifyParent;

  const DiagnoseResultCarousel({
    super.key,
    required this.selections,
    required this.notifyParent,
  });

  @override
  State<DiagnoseResultCarousel> createState() => _DiagnoseResultCarouselState();
}

class _DiagnoseResultCarouselState extends State<DiagnoseResultCarousel> {
  Map<Flower, bool> _flowerSelections = {};
  final List<CardFlowerForDiagnose> _flowerCards = <CardFlowerForDiagnose>[];

  void toggleSelection(Flower flower) {
    print('hola');
    setState(() {
      widget.notifyParent(flower);
    });
  }

  @override
  void initState() {
    super.initState();
    _flowerSelections = {
      for (Flower flower in widget.selections) flower: false
    };
    for (Flower flower in widget.selections) {
      _flowerCards.add(CardFlowerForDiagnose(
          toggleFlower: toggleSelection,
          flower: flower,
          flowerSelections: _flowerSelections));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.6,
      ),
      items: _flowerCards,
    );
  }
}
