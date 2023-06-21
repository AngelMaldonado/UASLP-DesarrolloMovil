import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/flower.dart';

class Diagnose extends StatelessWidget {
  final Future<List<Flower>> flowers;

  const Diagnose({super.key, required this.flowers});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: flowers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(mainPadding),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: UnconstrainedBox(
                  child: Container(
                    decoration: BoxDecoration(),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(MdiIcons.fire),
                        Text(
                          'Afronta tus miedos',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                const SizedBox(height: mainPadding),
            itemCount: 7,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

/*
Text(
                'Seleccione de 1 a 7 estados de una o más categorías emocionales',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
              ),
 */
