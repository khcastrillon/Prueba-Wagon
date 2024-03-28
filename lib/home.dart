import 'package:flutter/material.dart';
import 'package:prueba_wagon/data.dart';
import 'package:prueba_wagon/dbHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de servicios'),
        ),
        body: Column(
          children: [
            FutureBuilder<List<Servicio>>(
              future: dbHelper.getServices(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Servicio>> snapshot) {
                if (snapshot.hasData) {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('Service Name')),
                      DataColumn(label: Text('Service Description')),
                    ],
                    rows: snapshot.data!
                        .map((service) => DataRow(cells: [
                              DataCell(Text(service.ruta)),
                              DataCell(Text(service.estado)),
                            ]))
                        .toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Salir"),
              ),
            ),
          ],
        ));
  }
}
