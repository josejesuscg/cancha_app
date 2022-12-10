import 'dart:io';
import 'package:cancha_app/domain/models/reservation_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static dynamic _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if(_database != null ) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ReservDB.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Reservs(
            id INTEGER PRIMARY KEY,
            date TEXT,
            nameUser TEXT,
            weatherIcon TEXT,
            weather TEXT,
            nameCourt TEXT,
            address TEXT,
            imgCourt TEXT
          );
        ''');
      }

    );
  }

  Future<int>nuevaReserv(Reservation reservation) async {
    final db = await database;
    final res = await db.insert('Reservs', reservation.toJson());

    return res;
  }

   Future<int> deleteReserv(int id) async {
      final db = await database;
  
      final res = await db.delete('Reservs', where: 'id = ?', whereArgs: [id] );
      return res;
  }

    Future<List<Reservation>?> getAllReservs() async {
      final db = await database;
      final res = await db.query('Reservs');

      return res.isNotEmpty
        ? res.map((s) {
          return Reservation.fromJson(s);}).toList()
        : [];
  }
     
     
}


