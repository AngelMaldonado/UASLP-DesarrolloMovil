import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jardindebach/utils/constants.dart';
import 'package:jardindebach/widgets/emotion_card.dart';

import '../models/flower.dart';

class Diagnose extends StatefulWidget {
  final Future<List<Flower>> flowers;

  const Diagnose({super.key, required this.flowers});

  @override
  State<Diagnose> createState() => _DiagnoseState();
}

class _DiagnoseState extends State<Diagnose> {
  List<String> attributes = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.flowers,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: Text(
                  'Seleccione de 1 a 7 atributos de una o más tarjetas',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.6),
                items: [
                  'Afronta tus miedos',
                  'Conoce tu propia mente',
                  'Siéntete firme',
                  'Vive el día a día',
                  'Vive y deja vivir',
                  'Entiende a los demás',
                  'Encuentra felicidad y esperanza',
                ]
                    .asMap()
                    .map(
                      (key, value) => MapEntry(
                        key,
                        EmotionCard(
                          legend: value,
                          image: AssetImage('assets/img/emotion-$key.jpg'),
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(mainPadding),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Crear diagnóstico'),
                      Chip(label: Text('Selecciones: ')),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
