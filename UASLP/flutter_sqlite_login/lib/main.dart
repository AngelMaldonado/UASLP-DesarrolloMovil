// Para no tener que esperar el elemento de guardado
import 'dart:async';
// Para todas las operaciones de guardado
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Biblioteca importada para el manejo de la base de datos
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MaterialApp(
    title: 'Reading and Writing Files',
    home: FlutterDemo(storage: CounterStorage()),
  ));
}

class CounterStorage {
  // Los elementos Future significan que en algun momento se va a
  // obtener un objeto de tipo String (se manejan como promesas).
  // Se utiliza la función get para obtener el directorio donde se
  // guardará el archivo DocumentosDeAplicación de manera asíncrona.
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // readAsString retorna una promesa que contiene el contenido del archivo
      // como una cadena de texto.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // Si no se encuentra el archivo, se retorna un valor por defecto
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // writeAsString retorna una promesa que contiene el archivo
    // como una cadena de texto.
    return file.writeAsString('$counter');
  }
}

class FlutterDemo extends StatefulWidget {
  final CounterStorage storage;

  const FlutterDemo({Key? key, required this.storage}) : super(key: key);

  @override
  _FlutterDemoState createState() => _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  late int _counter;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    // Se retorna una promesa que contiene el archivo
    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading and Writing Files'),
      ),
      body: Center(
        child: Text(
          'Button tapped $_counter time${_counter == 1 ? '' : 's'}.',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
