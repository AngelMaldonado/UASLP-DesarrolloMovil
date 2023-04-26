import 'package:flutter/material.dart';
import 'package:jardindebach/utils/colors.dart';

class CardFlower extends StatelessWidget {
  const CardFlower({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.network(
            'https://images.unsplash.com/photo-1491866766009-1292fd127204?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: primary100,
            child: const Text(
              'Nombre de la flor',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
