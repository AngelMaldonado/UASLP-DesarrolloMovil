import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/diagnose_result_carousel.dart';
import 'package:jardindebach/widgets/save_diagnose_modal.dart';

import '../models/flower.dart';

class DiagnoseResult extends StatefulWidget {
  final List<Flower> selections;

  const DiagnoseResult({super.key, required this.selections});

  @override
  State<DiagnoseResult> createState() => _DiagnoseResultState();
}

class _DiagnoseResultState extends State<DiagnoseResult> {
  final List<Flower> _selectedFlowers = <Flower>[];

  static const snackNoFlowers = SnackBar(
    content: Text('Eliga al menos una flor'),
  );

  void toggleFlower(Flower flower) {
    setState(() {
      _selectedFlowers.contains(flower)
          ? _selectedFlowers.remove(flower)
          : _selectedFlowers.add(flower);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Nuevo diagnóstico'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: Text(
              'Eliga 1 o más flores para guardar su diagnóstico:',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black),
            ),
          ),
          DiagnoseResultCarousel(
            selections: widget.selections,
            notifyParent: toggleFlower,
          ),
          Padding(
            padding: const EdgeInsets.all(mainPadding),
            child: ElevatedButton(
              onPressed: () {
                if (_selectedFlowers.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(snackNoFlowers);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => SaveDiagnoseModal(
                      selectedFlowers: _selectedFlowers,
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Guardar diagnóstico'),
                  Chip(label: Text('${_selectedFlowers.length}')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
