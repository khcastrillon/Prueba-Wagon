import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/features/service/domain/entities/service.dart';

abstract interface class ServiceRepository {
  Future<Either<Failure, Service>> createService({
    required DateTime horaServicio,
    required DateTime horaEspera,
    required int cupos,
    required String estado,
    required String ruta,
    required String conductorId,
    required String vehiculoId,
  });
  // Future<ServiceModel> updateService(ServiceModel serviceModel);
  // Future<ServiceModel> getService();
}
