import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:jardindebach/models/diagnose.dart';
import 'package:jardindebach/models/flower.dart';
import 'package:palette_generator/palette_generator.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Flower>> getFlowers() async {
  List<Flower> flowers = [];
  ImageProvider image;
  CollectionReference collection = db.collection('flowers');
  QuerySnapshot query = await collection.get();
  for (var document in query.docs) {
    image = AssetImage('assets/img/${document.get('name')}.jpg');
    flowers.add(Flower(
      document.get('description'),
      document.get('gives'),
      document.get('name'),
      document.get('treats'),
      document.get('phrase'),
      image,
      await PaletteGenerator.fromImageProvider(
        ResizeImage(image, width: 5, height: 5),
      ),
    ));
  }
  return flowers;
}

Future<List<String>> getPhrasesThatTreats(String treats) async {
  List<String> phrases = [];
  final collection =
      db.collection('flowers').where('treats', isEqualTo: treats);
  QuerySnapshot query = await collection.get();
  for (var document in query.docs) {
    phrases.add(document.get('phrase'));
  }
  return phrases;
}

Future<List<Flower>> getFlowersWithPhrases(List<String> phrases) async {
  List<Flower> flowers = [];
  AssetImage image;
  final collection = db.collection('flowers').where('phrase', whereIn: phrases);
  final query = await collection.get();
  for (var document in query.docs) {
    image = AssetImage('assets/img/${document.get('name')}.jpg');
    flowers.add(Flower(
      document.get('description'),
      document.get('gives'),
      document.get('name'),
      document.get('treats'),
      document.get('phrase'),
      image,
      await PaletteGenerator.fromImageProvider(
        ResizeImage(image, width: 5, height: 5),
      ),
    ));
  }
  return flowers;
}

Future<List<Diagnose>> getDiagnoses() async {
  List<Diagnose> diagnoses = [];
  Timestamp timestamp;
  CollectionReference collection = db.collection('diagnoses');
  QuerySnapshot query = await collection.get();
  for (var document in query.docs) {
    timestamp = document.get('date');
    diagnoses.add(Diagnose(
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch),
        document.get('description'),
        await getFlowersByNames(List<String>.from(document.get('flowers'))),
        document.get('name'),
        document.id));
  }
  return diagnoses;
}

Future<List<Flower>> getFlowersByNames(List<String> names) async {
  List<Flower> flowers = [];
  ImageProvider image;
  final collection = db.collection('flowers').where('name', whereIn: names);
  final query = await collection.get();
  for (var document in query.docs) {
    image = AssetImage('assets/img/${document.get('name')}.jpg');
    flowers.add(Flower(
      document.get('description'),
      document.get('gives'),
      document.get('name'),
      document.get('treats'),
      document.get('phrase'),
      image,
      await PaletteGenerator.fromImageProvider(
        ResizeImage(image, width: 5, height: 5),
      ),
    ));
  }
  return flowers;
}

Future<void> createDiagnose(Diagnose newDiagnose) async {
  await db.collection('diagnoses').add(newDiagnose.toJson());
}

void deleteDiagnose(Diagnose diagnose) async {
  await db.collection('diagnoses').doc(diagnose.id).delete();
}

void updateDiagnose(Diagnose diagnose) async {
  await db.collection('diagnoses').doc(diagnose.id).update(
    {
      'date': DateTime.now(),
      'description': diagnose.description,
      'name': diagnose.name,
    },
  );
}
