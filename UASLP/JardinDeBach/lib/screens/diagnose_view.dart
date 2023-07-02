import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/row_flowers.dart';

import '../models/diagnose.dart';

class DiagnoseView extends StatefulWidget {
  final Diagnose diagnose;

  const DiagnoseView({super.key, required this.diagnose});

  @override
  State<DiagnoseView> createState() => _DiagnoseViewState();
}

class _DiagnoseViewState extends State<DiagnoseView> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.diagnose.name;
    _descriptionController.text = widget.diagnose.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagnóstico'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(mainPadding),
        children: <Widget>[
          Text(
            '${widget.diagnose.date.day}/${widget.diagnose.date.month}/${widget.diagnose.date.year}',
          ),
          const SizedBox(height: mainPadding),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Nombre'),
            ),
          ),
          const SizedBox(height: mainPadding),
          TextField(
            controller: _descriptionController,
            autofocus: false,
            maxLines: null,
            minLines: 8,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Descripción'),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.save),
            label: const Text('Guardar'),
          ),
          const SizedBox(height: mainPadding),
          const Text('Flores elegidas:'),
          const SizedBox(height: mainPadding),
          RowFlowers(flowers: widget.diagnose.flowers, cardSize: 120),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            label: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }
}
