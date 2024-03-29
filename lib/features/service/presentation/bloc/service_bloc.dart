import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_wagon/features/service/domain/usecases/create_service.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final CreateService createService;
  ServiceBloc(this.createService) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) => emit(ServiceLoading()));
    on<ServiceCreate>(_onServiceCreate);
  }

  void _onServiceCreate(
    ServiceCreate event,
    Emitter<ServiceState> emit,
  ) async {
    final res = await createService(CreateServiceParams(
      horaServicio: event.horaServicio,
      horaEspera: event.horaEspera,
      cupos: event.cupos,
      estado: event.estado,
      ruta: event.ruta,
      conductorId: event.conductorId,
      vehiculoId: event.vehiculoId,
    ));

    res.fold(
        (l) => emit(ServiceFailure(l.message)), (r) => emit(ServiceSuccess()));
  }
}
