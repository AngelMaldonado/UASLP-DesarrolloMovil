import 'package:flutter/material.dart';
import 'package:jardindebach/widgets/card_flower.dart';
import '../models/flower.dart';
import '../utils/constants.dart';

class FlowersList extends StatelessWidget {
  final Future<List<Flower>?> flowers;

  const FlowersList({super.key, required this.flowers});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: flowers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.all(mainPadding),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CardFlower(flower: snapshot.data![index]);
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: mainPadding),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
