import 'package:flutter/material.dart';
import 'package:prueba_wagon/features/service/presentation/pages/add_service.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicios'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, AddService.route());
            },
            icon: const Icon(Icons.add_circle_outline),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              iconSize: MaterialStateProperty.all(40),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Servicio $index'),
            subtitle: Text('Descripcion del servicio $index'),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
