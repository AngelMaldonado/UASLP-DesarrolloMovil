import 'package:flutter/material.dart';
import 'package:jardindebach/utils/colors.dart';
import 'package:jardindebach/utils/constants.dart';
import '../models/flower.dart';
import '../screens/flower_view.dart';

class CardFlowerForDiagnose extends StatefulWidget {
  final void Function(Flower) toggleFlower;
  final Flower flower;
  final Map<Flower, bool> flowerSelections;

  const CardFlowerForDiagnose({
    super.key,
    required this.toggleFlower,
    required this.flower,
    required this.flowerSelections,
  });

  @override
  State<CardFlowerForDiagnose> createState() => _CardFlowerForDiagnoseState();
}

class _CardFlowerForDiagnoseState extends State<CardFlowerForDiagnose> {
  void toggleSelection() {
    setState(() {
      widget.flowerSelections.update(
        widget.flower,
        (chk) => chk ? false : true,
      );
    });
    widget.toggleFlower(widget.flower);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlowerView(flower: widget.flower),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: mainPadding),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/${widget.flower.name}.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(mainPadding),
              color: widget.flowerSelections[widget.flower]!
                  ? primary5opacity
                  : primary50opacity,
              child: Text(
                widget.flower.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: widget.flowerSelections[widget.flower]!
                          ? primary100
                          : Colors.white,
                    ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(mainPadding),
              color: widget.flowerSelections[widget.flower]!
                  ? primary5opacity
                  : primary50opacity,
              child: Column(
                children: <Widget>[
                  Chip(label: Text('Concede: ${widget.flower.gives}')),
                  Chip(
                    label: Text('Trata: ${widget.flower.treats}'),
                    labelStyle: const TextStyle(color: primary5),
                    backgroundColor: primary50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: widget.flowerSelections[widget.flower]!
                          ? const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(highlight),
                            )
                          : Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () => toggleSelection(),
                      child: widget.flowerSelections[widget.flower]!
                          ? const Text('Quitar')
                          : const Text('Agregar'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
