import 'package:flutter/material.dart';
import 'package:jardindebach/screens/diagnose_result.dart';
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
  final List<Flower> _selections = <Flower>[];
  final SnackBar _snackOverflow = const SnackBar(
    content: Text('Solo se pueden elegir 7 atributos en total'),
  );

  void flowerToggle(Flower flower) {
    setState(() {
      _selections.contains(flower)
          ? _selections.remove(flower)
          : _selections.add(flower);
    });
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
              DiagnoseCarousel(
                flowers: snapshot.data!,
                notifyParent: flowerToggle,
              ),
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: ElevatedButton(
                  onPressed: () {
                    if (_selections.length > 7) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        _snackOverflow,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DiagnoseResult(selections: _selections),
                        ),
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Crear diagnóstico'),
                      Chip(label: Text('${_selections.length}')),
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
