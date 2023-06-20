import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/diagnose_form.dart';

class Diagnose extends StatefulWidget {
  const Diagnose({super.key});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(mainPadding),
      children: const <Widget>[
        Text(
          'Marque las casillas de acuerdo a su situación o personalidad:',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 20),
        DiagnoseForm(),
      ],
    );
  }
}
