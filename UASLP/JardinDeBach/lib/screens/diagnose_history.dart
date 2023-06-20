import 'package:flutter/material.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/card_diagnose.dart';

import '../models/diagnose.dart';

class DiagnoseHistory extends StatefulWidget {
  const DiagnoseHistory({super.key});

  @override
  State<DiagnoseHistory> createState() => _DiagnoseHistoryState();
}

class _DiagnoseHistoryState extends State<DiagnoseHistory> {
  Future<List<Diagnose>>? _diagnoses;

  @override
  void initState() {
    super.initState();
    _diagnoses = getDiagnoses();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _diagnoses,
      builder: (context, AsyncSnapshot<List<Diagnose>> snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            padding: const EdgeInsets.all(mainPadding),
            itemBuilder: (context, index) {
              return CardDiagnose(diagnose: snapshot.data![index]);
            },
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: snapshot.data!.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
