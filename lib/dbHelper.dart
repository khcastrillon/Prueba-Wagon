import 'package:prueba_wagon/data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Usuario?> getUser(String nombre, String password) async {
    var dbClient = await db;
    var result = await dbClient!.query("Usuario",
        where: 'nombre = ? AND password = ?', whereArgs: [nombre, password]);
    return result.isNotEmpty ? Usuario.fromMap(result.first) : null;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'my_local_db.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Usuario (id TEXT PRIMARY KEY, nombre TEXT, password TEXT, tipoUsuario TEXT)');
    await db.execute(
        'CREATE TABLE Vehiculo (id INTEGER PRIMARY KEY, conductorId TEXT, FOREIGN KEY (conductorId) REFERENCES Usuario (id))');
    await db.execute(
        'CREATE TABLE Ruta (id TEXT PRIMARY KEY,horaServicio TEXT, horaEspera TEXT, cupos INTEGER, estado TEXT, ruta TEXT, vehiculoId TEXT, conductorId TEXT, FOREIGN KEY (vehiculoId) REFERENCES Vehiculo (id), FOREIGN KEY (conductorId) REFERENCES Usuario (id))');

    await db.execute(
        "INSERT INTO Usuario (id, nombre, password, tipoUsuario) VALUES ('0', 'admin', 'password', 'admin')");

    // Insert dummy data into Usuario table
    for (int i = 1; i <= 5; i++) {
      await db.execute(
          "INSERT INTO Usuario (id, nombre, password, tipoUsuario) VALUES ('$i', 'Dummy User $i', 'password', 'conductor')");
    }

    // Insert dummy data into Vehiculo table
    for (int i = 1; i <= 5; i++) {
      await db
          .execute("INSERT INTO Vehiculo (id, conductorId) VALUES ($i, '$i')");
    }

    // Insert dummy data into Ruta table
    for (int i = 1; i <= 5; i++) {
      await db.execute(
          "INSERT INTO Ruta (id, horaServicio, horaEspera, cupos, estado, ruta, vehiculoId, conductorId) VALUES ('$i', '08:00', '10:00', 4, 'activo', 'ruta1', '$i', '$i')");
    }
  }
}
