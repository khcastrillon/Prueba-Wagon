import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/core/usecase/usecase.dart';
import 'package:prueba_wagon/features/service/domain/entities/service.dart';
import 'package:prueba_wagon/features/service/domain/repositories/service_repository.dart';

class CreateService implements UseCase<Service, CreateServiceParams> {
  final ServiceRepository repository;
  CreateService(this.repository);

  @override
  Future<Either<Failure, Service>> call(CreateServiceParams params) async {
    return await repository.createService(
      horaServicio: params.horaServicio,
      horaEspera: params.horaEspera,
      cupos: params.cupos,
      estado: params.estado,
      ruta: params.ruta,
      conductorId: params.conductorId,
      vehiculoId: params.vehiculoId,
    );
  }
}

class CreateServiceParams {
  final DateTime horaServicio;
  final DateTime horaEspera;
  final int cupos;
  final String estado;
  final String ruta;
  final String conductorId;
  final String vehiculoId;

  CreateServiceParams({
    required this.horaServicio,
    required this.horaEspera,
    required this.cupos,
    required this.estado,
    required this.ruta,
    required this.conductorId,
    required this.vehiculoId,
  });
}
