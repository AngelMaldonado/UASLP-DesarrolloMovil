import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/card_flower_for_diagnose.dart';

import '../models/diagnose.dart';
import '../models/flower.dart';

class DiagnoseResult extends StatefulWidget {
  final List<String> selections;

  const DiagnoseResult({super.key, required this.selections});

  @override
  State<DiagnoseResult> createState() => _DiagnoseResultState();
}

class _DiagnoseResultState extends State<DiagnoseResult> {
  late List<Flower> _selectedFlowers;
  Future<List<Flower>>? _flowers;
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  static const snackNoFlowers =
      SnackBar(content: Text('Eliga al menos una flor'));

  static const snackNoName = SnackBar(content: Text('Ingrese el nombre'));

  static const snackNoDescription =
      SnackBar(content: Text('Ingrese una descripción'));

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
    _flowers = getFlowersWithPhrases(widget.selections);
    _selectedFlowers = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo diagnóstico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: FutureBuilder(
          future: _flowers,
          builder:
              (BuildContext context, AsyncSnapshot<List<Flower>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: <Widget>[
                  const Text(
                    'Eliga 1 o más flores para guardar su diagnóstico:',
                    style: TextStyle(fontSize: 22),
                  ),
                  ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardFlowerForDiagnose(
                        flower: snapshot.data![index],
                        toggleFlower: toggleFlower,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: snapshot.data!.length,
                  ),
                  const SizedBox(height: mainPadding),
                  Text('Flores seleccionadas: ${_selectedFlowers.length}'),
                  const SizedBox(height: mainPadding),
                  SizedBox(
                    height: 52,
                    child: TextField(
                      controller: _nameController,
                      autofocus: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Nombre'),
                      ),
                    ),
                  ),
                  const SizedBox(height: mainPadding),
                  TextField(
                    controller: _descriptionController,
                    autofocus: false,
                    maxLines: null,
                    minLines: 4,
                    maxLength: 120,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Descripción'),
                    ),
                  ),
                  const SizedBox(height: mainPadding),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      if (_selectedFlowers.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackNoFlowers);
                      } else if (_nameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(snackNoName);
                      } else if (_descriptionController.text.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(snackNoDescription);
                      } else {
                        createDiagnose(Diagnose(
                            DateTime.now(),
                            _descriptionController.text,
                            _selectedFlowers,
                            _nameController.text)).then((_) =>
                            Navigator.popUntil(context, (route) => route.isFirst)
                        );
                      }
                    },
                    child: const Text(
                      'Guardar Diagnóstico',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
