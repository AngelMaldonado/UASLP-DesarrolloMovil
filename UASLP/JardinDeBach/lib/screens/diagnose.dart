import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/diagnose_carousel.dart';

import '../models/flower.dart';

class Diagnose extends StatefulWidget {
  final Future<List<Flower>> flowers;

  const Diagnose({super.key, required this.flowers});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  Map<Flower, bool> flowerSelections = {};

  void flowerToggle(Flower flower) {
    setState(() {
      //flowerSelections[flower] = flowerSelections[flower] ? true : false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.flowers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          flowerSelections = {for (var flower in snapshot.data!) flower: false};
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
              DiagnoseCarousel(
                selections: flowerSelections,
                notifyParent: flowerToggle,
              ),
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Crear diagnóstico'),
                      Chip(
                        label: Text(
                          '${flowerSelections.values.where((chk) => chk).length}',
                        ),
                      ),
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
