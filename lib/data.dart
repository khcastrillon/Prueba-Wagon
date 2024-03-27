class Usuario {
  String id;
  String nombre;
  String password;
  String tipoUsuario; // 'Admin' o 'Conductor'
  Usuario(this.id, this.nombre, this.password, this.tipoUsuario);

  static fromMap(Map<String, Object?> first) {}
}

class Vehiculo {
  String id;
  Usuario conductor;
  Vehiculo(this.id, this.conductor);

  static fromMap(Map<String, Object?> first) {}
}

class Servicio {
  String id;
  DateTime horaServicio;
  DateTime horaEspera;
  int cupos;
  String estado;
  String ruta;
  String nombre;
  Vehiculo vehiculo;
  Usuario conductor;

  Servicio(this.id, this.horaServicio, this.horaEspera, this.cupos, this.estado,
      this.ruta, this.nombre, this.vehiculo, this.conductor);

  static fromMap(Map<String, Object?> first) {}
}
