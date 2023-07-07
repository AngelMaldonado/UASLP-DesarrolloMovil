import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';

import '../models/diagnose.dart';
import '../utils/colors.dart';

class AlertUpdate extends StatelessWidget {
  final Diagnose diagnose;

  const AlertUpdate({super.key, required this.diagnose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Actualizar Diagnóstico', textAlign: TextAlign.center),
      content: Text(
        '¿Está seguro que desea actualizar el diagnóstico?',
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(highlight),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
            onPressed: () {
              updateDiagnose(diagnose);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/history',
                (_) => false,
              );
            },
            child: const Text('Guardar'))
      ],
    );
  }
}
