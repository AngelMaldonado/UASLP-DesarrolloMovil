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

  void toggleFlower() {
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
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/${widget.flower.name}.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}


/*
Card(
        color: _selected ? primary10 : primary50,
        elevation: _selected ? 8 : null,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Ink.image(
                  image: widget.flower.image,
                  height: MediaQuery.of(context).size.height / 4,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(mainPadding),
                  color: primary100opacity,
                  child: Text(
                    widget.flower.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text('Trata: ', textAlign: TextAlign.end),
                      Chip(label: Text(widget.flower.treats)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const Text('Concede: ', textAlign: TextAlign.end),
                      Chip(label: Text(widget.flower.gives)),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      toggleFlower();
                    },
                    child: const Text('Elegir flor'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
 */