import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jardindebach/models/flower.dart';
import 'package:jardindebach/utils/colors.dart';

import '../utils/constants.dart';

class FlowerView extends StatelessWidget {
  final Flower flower;

  const FlowerView({super.key, required this.flower});

  Color _getMainColor() {
    return flower.imageColors.vibrantColor != null
        ? flower.imageColors.vibrantColor!.color
        .withOpacity(0.7)
        : flower.imageColors.dominantColor!.color
        .withOpacity(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(flower.name), backgroundColor:_getMainColor()),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: flower.image,
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Card(
                  color: _getMainColor(),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(mainPadding),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          flower.description,
                          textAlign: TextAlign.center,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyMedium
                        ),
                        const SizedBox(height: mainPadding),
                        Text(
                          'Concede:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                        Chip(label: Text(flower.gives),),
                        const SizedBox(height: mainPadding),
                        Text(
                          'Trata:',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineSmall,
                        ),
                        Chip(
                          label: Text(flower.treats),
                          labelStyle: const TextStyle(color: primary5),
                          backgroundColor: primary50,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}



