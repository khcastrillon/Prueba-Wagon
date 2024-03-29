import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/core/utils/show_snackbar.dart';
import 'package:prueba_wagon/features/service/presentation/bloc/service_bloc.dart';

class AddService extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const AddService(),
      );
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final hora1Controller = TextEditingController();
  final hora2Controller = TextEditingController();
  final cuposController = TextEditingController();
  final estadoController = TextEditingController();
  final rutaController = TextEditingController();
  final conductorController = TextEditingController();
  final vehiculoController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void createService() {
    if (formKey.currentState!.validate()) {
      context.read<ServiceBloc>().add(
            ServiceCreate(
              horaServicio: DateTime.parse(hora1Controller.text),
              horaEspera: DateTime.parse(hora2Controller.text),
              cupos: int.parse(cuposController.text),
              estado: estadoController.text,
              ruta: rutaController.text,
              conductorId: conductorController.text,
              vehiculoId: vehiculoController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    hora1Controller.dispose();
    hora2Controller.dispose();
    cuposController.dispose();
    estadoController.dispose();
    rutaController.dispose();
    conductorController.dispose();
    vehiculoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: createService,
            icon: const Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: BlocConsumer<ServiceBloc, ServiceState>(
        listener: (context, state) {
          if (state is ServiceFailure) {
            showSnackBar(context, state.message);
          } else if (state is ServiceSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Hora del servicio',
                    ),
                    controller: hora1Controller,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'hora de espera',
                    ),
                    controller: hora2Controller,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Cupos',
                    ),
                    controller: cuposController,
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
                    onChanged: (value) {
                      estadoController.text = value.toString();
                    },
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
                    onChanged: (value) {
                      rutaController.text = value.toString();
                    },
                  ),
                  const Text('Conductor'),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        value: '9c6c3cc5-11f0-461a-a55f-72eefdd8c685',
                        child: Text('Conductor1'),
                      ),
                      DropdownMenuItem(
                        value: 'Conductor2',
                        child: Text('Conductor2'),
                      )
                    ],
                    onChanged: (value) {
                      conductorController.text = value.toString();
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Vehiculo'),
                  DropdownButtonFormField(
                    items: const [
                      DropdownMenuItem(
                        value: '13718cd5-5914-46db-9463-b8585662558d',
                        child: Text('Vehiculo1'),
                      ),
                      DropdownMenuItem(
                        value: 'Vehiculo2',
                        child: Text('Vehiculo2'),
                      )
                    ],
                    onChanged: (value) {
                      vehiculoController.text = value.toString();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
