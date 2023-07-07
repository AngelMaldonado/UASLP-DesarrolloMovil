import 'flower.dart';

class Diagnose {
  final String id;
  final DateTime date;
  String description;
  final List<Flower> flowers;
  String name;

  Diagnose(this.date, this.description, this.flowers, this.name, this.id);

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date,
        'description': description,
        'flowers': flowers.map((flower) => flower.name).toList(),
        'name': name
      };
}
