import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/emotion_card.dart';

import '../models/flower.dart';

class Diagnose extends StatefulWidget {
  final Future<List<Flower>> flowers;

  const Diagnose({super.key, required this.flowers});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  List<Flower> flowerAttributesSelections = [];
  List<String> treatedEmotionsLegends = [
    'Afronta tus miedos',
    'Conoce tu propia mente',
    'Siéntete firme',
    'Vive el día a día',
    'Vive y deja vivir',
    'Llega a los demás',
    'Encuentra felicidad y esperanza',
  ];

  int toggleAttribute(Flower attribute) {
    setState(() {
      flowerAttributesSelections.contains(attribute)
          ? flowerAttributesSelections.remove(attribute)
          : flowerAttributesSelections.add(attribute);
    });
    return flowerAttributesSelections.length;
  }

  List<Widget> generateCarouselCards(List<Flower> flowers) {
    Map<String, String> emotionsMap = Map<String, String>.fromIterables(
        Flower.getUniqueTreatedEmotions(flowers), treatedEmotionsLegends);
    List<Widget> carouselCards = <Widget>[];
    List<Flower> cardFlowers = <Flower>[];
    int index = -1;

    emotionsMap.forEach((emotion, legend) {
      index = emotionsMap.values.toList().indexOf(legend);
      cardFlowers =
          flowers.where((flower) => flower.treats == emotion).toList();
      carouselCards.add(
        EmotionCard(
          legend: legend,
          image: AssetImage('assets/img/emotion-$index.jpg'),
          flowers: cardFlowers,
          onSelectionClick: toggleAttribute,
        ),
      );
    });
    return carouselCards;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.flowers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Text(
                  'Seleccione de 1 a 7 atributos de una o más categorías',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6),
                items: generateCarouselCards(snapshot.data!),
              ),
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Crear diagnóstico'),
                      Chip(label: Text('${flowerAttributesSelections.length}')),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
