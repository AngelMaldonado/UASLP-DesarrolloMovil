import 'package:flutter/material.dart';

import '../models/diagnose.dart';
import '../models/flower.dart';
import '../services/firebase_service.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class SaveDiagnoseModal extends StatefulWidget {
  final List<Flower> selectedFlowers;

  const SaveDiagnoseModal({super.key, required this.selectedFlowers});

  @override
  State<SaveDiagnoseModal> createState() => _SaveDiagnoseModalState();
}

class _SaveDiagnoseModalState extends State<SaveDiagnoseModal> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _emptyField = false;

  void setEmptinessFields(bool value) {
    setState(() => _emptyField = value);
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Guardar diagnóstico'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Visibility(
                visible: _emptyField,
                child: Text(
                  'Ingrese su nombre y una breve descripción',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: highlight),
                ),
              ),
              const SizedBox(height: mainPadding),
              TextField(
                onTap: () => setEmptinessFields(false),
                controller: _nameController,
                autofocus: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nombre'),
                ),
              ),
              const SizedBox(height: mainPadding),
              TextField(
                onTap: () => setEmptinessFields(false),
                controller: _descriptionController,
                autofocus: false,
                maxLines: null,
                minLines: 9,
                maxLength: 120,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Descripción'),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(highlight),
              ),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _descriptionController.text.isEmpty) {
                    setEmptinessFields(true);
                  } else {
                    createDiagnose(Diagnose(
                            DateTime.now(),
                            _descriptionController.text,
                            widget.selectedFlowers,
                            _nameController.text))
                        .then(
                      (_) => Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        (route) => route.settings.name == '/',
                      ),
                    );
                  }
                },
                child: const Text('Guardar'))
          ],
        );
      },
    );
  }
}
