import 'package:flutter/cupertino.dart';

import '../models/flower.dart';

class RowFlowers extends StatefulWidget {
  final double cardSize;
  final List<Flower> flowers;

  const RowFlowers({super.key, required this.flowers, required this.cardSize});

  @override
  State<RowFlowers> createState() => _RowFlowersState();
}

class _RowFlowersState extends State<RowFlowers> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.cardSize + 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/img/${widget.flowers[index].name}.jpg',
                  width: widget.cardSize,
                  height: widget.cardSize,
                  fit: BoxFit.cover,
                ),
              ),
              Text(widget.flowers[index].name),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: widget.flowers.length,
      ),
    );
  }
}