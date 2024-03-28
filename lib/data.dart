class Usuario {
  String id;
  String nombre;
  String password;
  String tipoUsuario; // 'admin' o 'conductor'
  Usuario(this.id, this.nombre, this.password, this.tipoUsuario);

  static Usuario fromMap(Map<String, dynamic> map) {
    return Usuario(
      map['id'] as String,
      map['nombre'] as String,
      map['password'] as String,
      map['tipoUsuario'] as String,
    );
  }
}

class Vehiculo {
  String id;
  String conductor;
  Vehiculo(this.id, this.conductor);

  static fromMap(Map<String, Object?> first) {
    return Vehiculo(
      first['id'] as String,
      first['conductorId'] as String,
    );
  }
}

class Servicio {
  String id;
  DateTime horaServicio;
  DateTime horaEspera;
  int cupos;
  String estado;
  String ruta;
  String vehiculo;
  String conductor;

  Servicio(this.id, this.horaServicio, this.horaEspera, this.cupos, this.estado,
      this.ruta, this.vehiculo, this.conductor);

  static fromMap(Map<String, Object?> first) {
    return Servicio(
      first['id'] as String,
      DateTime.parse(first['horaServicio'] as String),
      DateTime.parse(first['horaEspera'] as String),
      first['cupos'] as int,
      first['estado'] as String,
      first['ruta'] as String,
      first['vehiculoId'] as String,
      first['conductorId'] as String,
    );
  }
}
