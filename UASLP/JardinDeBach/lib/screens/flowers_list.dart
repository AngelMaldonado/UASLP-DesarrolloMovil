import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:jardindebach/widgets/card_flower.dart';
import '../models/flower.dart';
import '../utils/constants.dart';

class FlowersList extends StatefulWidget {
  const FlowersList({super.key});

  @override
  State<FlowersList> createState() => _FlowersListState();
}

class _FlowersListState extends State<FlowersList> {
  Future<List<Flower>>? _flowers;

  @override
  void initState() {
    super.initState();
    _flowers = getFlowers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _flowers,
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
