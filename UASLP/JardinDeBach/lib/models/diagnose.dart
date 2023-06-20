import 'flower.dart';

class Diagnose {
  final DateTime date;
  final String description;
  final List<Flower> flowers;
  final String name;

  Diagnose(this.date, this.description, this.flowers, this.name);

  Map<String, dynamic> toJson() => {
        'date': date,
        'description': description,
        'flowers': flowers.map((flower) => flower.name).toList(),
        'name': name
      };
}
