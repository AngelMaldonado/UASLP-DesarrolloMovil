import 'package:flutter/material.dart';
import 'package:jardindebach/screens/diagnose_result.dart';
import 'package:jardindebach/services/firebase_service.dart';
import 'package:multiselect/multiselect.dart';

import '../models/flower.dart';

class DiagnoseForm extends StatefulWidget {
  const DiagnoseForm({super.key});

  @override
  State<DiagnoseForm> createState() => _DiagnoseFormState();
}

class _DiagnoseFormState extends State<DiagnoseForm> {
  Future<List<Flower>>? _flowers;
  List<String> _selectedMiedo = [];
  List<String> _selectedIncertidumbre = [];
  List<String> _selectedSensibilidad = [];
  List<String> _selectedInteres = [];
  List<String> _selectedPreocupacion = [];
  List<String> _selectedSoledad = [];
  List<String> _selectedTristeza = [];
  static const snackOverflow =
      SnackBar(content: Text('No se pueden seleccionar más de 7'));

  static const snackZero =
      SnackBar(content: Text('No se ha seleccionado ninguna emoción'));

  @override
  void initState() {
    super.initState();
    _flowers = getFlowers();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: FutureBuilder(
        future: _flowers,
        builder: (context, AsyncSnapshot<List<Flower>> snapshot) {
          if (snapshot.hasData) {
            List<Flower> flowers = snapshot.data!.toList();
            List<String> dropDownMiedos = [];
            List<String> dropDownIncertidumbre = [];
            List<String> dropDownSensibilidad = [];
            List<String> dropDownInteres = [];
            List<String> dropDownPreocupacion = [];
            List<String> dropDownSoledad = [];
            List<String> dropDownTristeza = [];
            for (var flower in flowers) {
              switch (flower.treats) {
                case 'Miedo':
                  dropDownMiedos.add(flower.phrase);
                  break;
                case 'Incertidumbre':
                  dropDownIncertidumbre.add(flower.phrase);
                  break;
                case 'Sensibilidad':
                  dropDownSensibilidad.add(flower.phrase);
                  break;
                case 'Falta de interés':
                  dropDownInteres.add(flower.phrase);
                  break;
                case 'Preocupación excesiva':
                  dropDownPreocupacion.add(flower.phrase);
                  break;
                case 'Soledad':
                  dropDownSoledad.add(flower.phrase);
                  break;
                case 'Tristeza':
                  dropDownTristeza.add(flower.phrase);
                  break;
              }
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Afronta tus miedos',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownMiedos,
                  selectedValues: _selectedMiedo,
                  onChanged: (value) {
                    _selectedMiedo = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Conoce tu propia mente',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownIncertidumbre,
                  selectedValues: _selectedIncertidumbre,
                  onChanged: (value) {
                    _selectedIncertidumbre = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Siéntete firme',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownSensibilidad,
                  selectedValues: _selectedSensibilidad,
                  onChanged: (value) {
                    _selectedSensibilidad = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Vive el día a día',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownInteres,
                  selectedValues: _selectedInteres,
                  onChanged: (value) {
                    _selectedInteres = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Vive y deja vivir',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownPreocupacion,
                  selectedValues: _selectedPreocupacion,
                  onChanged: (value) {
                    _selectedPreocupacion = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Llega a los demás',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownSoledad,
                  selectedValues: _selectedSoledad,
                  onChanged: (value) {
                    _selectedSoledad = value;
                  },
                ),
                const SizedBox(height: 12),
                const Text(
                  'Encuentra felicidad y esperanza',
                  style: TextStyle(fontSize: 20),
                ),
                DropDownMultiSelect(
                  options: dropDownTristeza,
                  selectedValues: _selectedTristeza,
                  onChanged: (value) {
                    _selectedTristeza = value;
                  },
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () async {
                    List<String> selecciones = _selectedTristeza +
                        _selectedSoledad +
                        _selectedPreocupacion +
                        _selectedInteres +
                        _selectedSensibilidad +
                        _selectedIncertidumbre +
                        _selectedMiedo;
                    if (selecciones.length > 7) {
                      ScaffoldMessenger.of(context).showSnackBar(snackOverflow);
                    } else if (selecciones.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snackZero);
                    } else {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DiagnoseResult(selections: selecciones)),
                      ).then((value) {
                        Navigator.pushReplacementNamed(context, '/');
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text('Diagnostico guardado'),
                            content: Text(
                                'Puede ver sus diagnósticos en la pestaña "Historial"'),
                          ),
                        );
                      });
                    }
                  },
                  child: const Text(
                    'Mostrar flores recomendadas',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
