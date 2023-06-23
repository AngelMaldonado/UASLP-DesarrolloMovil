import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';

class Flower {
  final String description;
  final String gives;
  final String name;
  final String treats;
  final String phrase;
  final ImageProvider image;
  final PaletteGenerator imageColors;

  Flower(
    this.description,
    this.gives,
    this.name,
    this.treats,
    this.phrase,
    this.image,
    this.imageColors,
  );

  static List<String> getUniqueTreatedEmotions(List<Flower> flowers) {
    Set<String> uniqueTreatedEmotions = <String>{};
    for (Flower flower in flowers) {
      uniqueTreatedEmotions.add(flower.treats);
    }
    return uniqueTreatedEmotions.toList();
  }
}
