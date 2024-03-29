import 'package:prueba_wagon/features/service/domain/entities/service.dart';

class ServiceModel extends Service {
  ServiceModel({
    required super.id,
    required super.horaServicio,
    required super.horaEspera,
    required super.cupos,
    required super.estado,
    required super.ruta,
    required super.conductorId,
    required super.vehiculoId,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      horaServicio: DateTime.parse(json['horaServicio']),
      horaEspera: DateTime.parse(json['horaEspera']),
      cupos: json['cupos'],
      estado: json['estado'],
      ruta: json['ruta'],
      conductorId: json['conductorId'],
      vehiculoId: json['vehiculoId'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'horaServicio': horaServicio.toIso8601String(),
      'horaEspera': horaEspera.toIso8601String(),
      'cupos': cupos,
      'estado': estado,
      'ruta': ruta,
      'conductorId': conductorId,
      'vehiculoId': vehiculoId,
    };
  }
}
