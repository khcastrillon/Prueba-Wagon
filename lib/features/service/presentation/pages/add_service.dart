import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AddService(),
      );
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Hora del servicio',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'hora de espera',
              ),
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Cupos',
              ),
            ),
            const SizedBox(height: 10),
            const Text('Estado'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Activo',
                  child: Text('Activo'),
                ),
                DropdownMenuItem(
                  value: 'Inactivo',
                  child: Text('Inactivo'),
                ),
                DropdownMenuItem(
                  value: 'Terminado',
                  child: Text('Terminado'),
                ),
              ],
              onChanged: (value) {},
            ),
            const Text('Ruta'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Ruta1',
                  child: Text('Ruta1'),
                ),
                DropdownMenuItem(
                  value: 'Ruta2',
                  child: Text('Ruta2'),
                )
              ],
              onChanged: (value) {},
            ),
            const Text('Conductor'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Conductor1',
                  child: Text('Conductor1'),
                ),
                DropdownMenuItem(
                  value: 'Conductor2',
                  child: Text('Conductor2'),
                )
              ],
              onChanged: (value) {},
            ),
            const SizedBox(height: 10),
            const Text('Vehiculo'),
            DropdownButtonFormField(
              items: const [
                DropdownMenuItem(
                  value: 'Vehiculo1',
                  child: Text('Vehiculo1'),
                ),
                DropdownMenuItem(
                  value: 'Vehiculo2',
                  child: Text('Vehiculo2'),
                )
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
