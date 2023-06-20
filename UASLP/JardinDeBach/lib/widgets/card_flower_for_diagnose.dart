import 'package:flutter/material.dart';
import 'package:jardindebach/utils/colors.dart';
import 'package:jardindebach/utils/constants.dart';
import '../models/flower.dart';
import '../screens/flower_view.dart';

class CardFlowerForDiagnose extends StatefulWidget {
  final Function(Flower flower) toggleFlower;
  final Flower flower;

  const CardFlowerForDiagnose(
      {super.key, required this.flower, required this.toggleFlower});

  @override
  State<CardFlowerForDiagnose> createState() => _CardFlowerForDiagnoseState();
}

class _CardFlowerForDiagnoseState extends State<CardFlowerForDiagnose> {
  bool _selected = false;

  void toggleClick() {
    setState(() {
      _selected = _selected ? false : true;
      widget.toggleFlower(widget.flower);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FlowerView(flower: widget.flower)),
        );
      },
      child: Card(
        color: _selected ? primary10 : Colors.white,
        elevation: _selected ? 8 : null,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Image.asset(
                  'assets/img/${widget.flower.name}.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(mainPadding),
                  color: primary100opacity,
                  child: Text(
                    widget.flower.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text(
                    'Te ayuda con: ',
                    textAlign: TextAlign.end,
                  ),
                  Chip(
                    label: Text(widget.flower.treats),
                    padding: const EdgeInsets.all(0.5),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Text('Te otorga: '),
                  Chip(
                    label: Text(widget.flower.gives),
                    padding: const EdgeInsets.all(0.5),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  toggleClick();
                },
                child: const Text(
                  'Elegir flor',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
