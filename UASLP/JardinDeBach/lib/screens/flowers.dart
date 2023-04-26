import 'package:flutter/cupertino.dart';
import 'package:jardindebach/widgets/card_flower.dart';

class Flowers extends StatelessWidget {
  const Flowers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12),
      children: const <CardFlower>[
        CardFlower(),
      ],
    );
  }
}
