import 'package:flutter/material.dart';
import 'package:jardindebach/screens/diagnose_view.dart';
import 'package:jardindebach/utils/colors.dart';

import '../models/diagnose.dart';

class CardDiagnose extends StatelessWidget {
  final Diagnose diagnose;

  const CardDiagnose({super.key, required this.diagnose});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: primary50,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${diagnose.date.day}/${diagnose.date.month}/${diagnose.date.year}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: primary100,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
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
                        onPressed: () {},
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
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/img/${diagnose.flowers[index].name}.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(diagnose.flowers[index].name),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: diagnose.flowers.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(diagnose.description),
            ),
          ],
        ),
      ),
    );
  }
}
