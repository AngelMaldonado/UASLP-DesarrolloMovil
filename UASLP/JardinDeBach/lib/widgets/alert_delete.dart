import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';

import '../models/diagnose.dart';
import '../utils/colors.dart';

class AlertDelete extends StatelessWidget {
  final Diagnose diagnose;

  const AlertDelete({super.key, required this.diagnose});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar Diagnóstico', textAlign: TextAlign.center),
      content: Text(
        '¿Está seguro que desea eliminar el diagnóstico de ${diagnose.name}?',
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(highlight),
            ),
            onPressed: () {
              deleteDiagnose(diagnose);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/history',
                (_) => false,
              );
            },
            child: const Text('Eliminar'))
      ],
    );
  }
}
