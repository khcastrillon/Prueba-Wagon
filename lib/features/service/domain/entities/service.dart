class Service {
  final String id;
  final DateTime horaServicio;
  final DateTime horaEspera;
  final int cupos;
  final String estado;
  final String ruta;
  final String conductorId;
  final String vehiculoId;

  Service({
    required this.id,
    required this.horaServicio,
    required this.horaEspera,
    required this.cupos,
    required this.estado,
    required this.ruta,
    required this.conductorId,
    required this.vehiculoId,
  });
}
