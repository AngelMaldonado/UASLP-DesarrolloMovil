import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:jardindebach/utils/colors.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/alert_delete.dart';
import 'package:jardindebach/widgets/alert_update.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Diagnóstico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Última actualización: '
              '${widget.diagnose.date.day}/${widget.diagnose.date.month}/${widget.diagnose.date.year}',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Nombre'),
              ),
            ),
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
            Text(
              'Flores elegidas:',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black),
            ),
            RowFlowers(flowers: widget.diagnose.flowers, cardSize: 120),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDelete(
                          diagnose: widget.diagnose,
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Eliminar'),
                    style: ElevatedButton.styleFrom(backgroundColor: highlight),
                  ),
                ),
                const SizedBox(width: mainPadding),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      widget.diagnose.name = _nameController.text;
                      widget.diagnose.description = _descriptionController.text;
                      showDialog(
                        context: context,
                        builder: (context) =>
                            AlertUpdate(diagnose: widget.diagnose),
                      );
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Guardar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
