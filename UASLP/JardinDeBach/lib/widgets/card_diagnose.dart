import 'package:flutter/material.dart';
import 'package:jardindebach/screens/diagnose_view.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:jardindebach/utils/colors.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/alert_delete.dart';
import 'package:jardindebach/widgets/row_flowers.dart';

import '../models/diagnose.dart';

class CardDiagnose extends StatelessWidget {
  final Diagnose diagnose;

  const CardDiagnose({super.key, required this.diagnose});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: primary50,
            padding: const EdgeInsets.symmetric(horizontal: mainPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${diagnose.date.day}/${diagnose.date.month}/${diagnose.date.year}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Wrap(
                  spacing: -10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DiagnoseView(diagnose: diagnose),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: primary100,
                      ),
                      child: const Icon(Icons.edit),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDelete(diagnose: diagnose),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: highlight,
                      ),
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              diagnose.name,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
          RowFlowers(flowers: diagnose.flowers, cardSize: 65),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              diagnose.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: diagnose.flowers.length,
            ),

 */
