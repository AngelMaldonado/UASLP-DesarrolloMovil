import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jardindebach/widgets/emotion_card.dart';

import '../models/flower.dart';

class DiagnoseCarousel extends StatefulWidget {
  final Map<Flower, bool> selections;
  final void Function(Flower) notifyParent;

  const DiagnoseCarousel({
    super.key,
    required this.selections,
    required this.notifyParent,
  });

  @override
  State<DiagnoseCarousel> createState() => _DiagnoseCarouselState();
}

class _DiagnoseCarouselState extends State<DiagnoseCarousel> {
  List<String> legends = [
    'Afronta tus miedos',
    'Conoce tu propia mente',
    'Siéntete firme',
    'Vive el día a día',
    'Vive y deja vivir',
    'Llega a los demás',
    'Encuentra felicidad y esperanza',
  ];
  List<EmotionCard> emotionCards = [];

  List<EmotionCard> generateEmotionCards() {
    List<String> emotions =
        Flower.getUniqueTreatedEmotions(widget.selections.keys.toList());
    Map<Flower, bool> cardSelections = {};
    List<EmotionCard> carouselCards = <EmotionCard>[];
    for (int index = 0; index < emotions.length - 1; index++) {
      cardSelections = {
        for (Flower flower in widget.selections.keys.where((flower) {
          return flower.treats == emotions[index];
        }))
          flower: widget.selections[flower]!
      };
      carouselCards.add(
        EmotionCard(
          legend: legends[index],
          image: AssetImage('assets/img/emotion-$index.jpg'),
          selections: cardSelections,
          notifyParent: widget.notifyParent,
        ),
      );
    }
    return carouselCards;
  }

  @override
  void initState() {
    super.initState();
    emotionCards = generateEmotionCards();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options:
          CarouselOptions(height: MediaQuery.of(context).size.height * 0.6),
      items: emotionCards,
    );
  }
}
