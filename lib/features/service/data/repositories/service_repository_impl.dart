import 'package:fpdart/fpdart.dart';
import 'package:prueba_wagon/core/error/exceptions.dart';
import 'package:prueba_wagon/core/error/failures.dart';
import 'package:prueba_wagon/features/service/data/datasources/service_data_source.dart';
import 'package:prueba_wagon/features/service/data/models/serviceModel.dart';
import 'package:prueba_wagon/features/service/domain/entities/service.dart';
import 'package:prueba_wagon/features/service/domain/repositories/service_repository.dart';
import 'package:uuid/uuid.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource serviceRemoteDataSource;
  ServiceRepositoryImpl(this.serviceRemoteDataSource);

  @override
  Future<Either<Failure, Service>> createService({
    required DateTime horaServicio,
    required DateTime horaEspera,
    required int cupos,
    required String estado,
    required String ruta,
    required String conductorId,
    required String vehiculoId,
  }) async {
    try {
      ServiceModel serviceModel = ServiceModel(
        id: const Uuid().v1(),
        horaServicio: horaServicio,
        horaEspera: horaEspera,
        cupos: cupos,
        estado: estado,
        ruta: ruta,
        conductorId: conductorId,
        vehiculoId: vehiculoId,
      );
      final serviceCreated =
          await serviceRemoteDataSource.createService(serviceModel);
      return Right(serviceCreated);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
