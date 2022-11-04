import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/report_bak.dart';


final String TableName = 'Report';

class DBHelper {
  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() => _db;

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    var documentsDirectory = await getDatabasesPath();
    String path = join(documentsDirectory, 'AgroDoctorDB.db');

    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute("CREATE TABLE Report ( "
          "id INTEGER PRIMARY KEY, "
          "name TEXT, "
          "userID INT, "
          "title TEXT, "
          "weatherID INT, "
          "cropKey TEXT, "
          "address TEXT, "
          "soilType INT, "
          "soilArea INT, "
          "gpsLat TEXT, "
          "gpsLong TEXT, "
          "score INT, "
          "isFavorite INT, "
          "element0 TEXT, "
          "element1 TEXT, "
          "element2 TEXT, "
          "element3 TEXT, "
          "element4 TEXT, "
          "element5 TEXT, "
          "element6 TEXT, "
          "element7 TEXT)");
    }, onUpgrade: (db, oldVersion, newVersion) {});
  }

  //Create
  createData(Report report) async {
    final db = await database;
    var res = await db!.insert(TableName, report.toJson());
    return res;
  }

  //Read
  getReport(int id) async {
    final db = await database;
    var res = await db!.query(TableName, where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Report.fromJson(res.first) : Null;
  }

  //Read All
  Future<List<Report>> getAllReports() async {
    final db = await database;
    var res = await db!.query(TableName);
    List<Report> list =
        res.isNotEmpty ? res.map((c) => Report.fromJson(c)).toList() : [];
    return list;
  }

  //Update
  updateReport(Report report) async {
    final db = await database;
    var res = db!.update(TableName, report.toJson(),
        where: 'id = ?', whereArgs: [report.id]);
    return res;
  }

  //Delete
  deleteReport(int id) async {
    final db = await database;
    var res = db!.delete(TableName, where: 'id = ?', whereArgs: [id]);
    return res;
  }

  //Delete All
  deleteAllReports() async {
    final db = await database;
    db!.rawDelete('DELETE FROM $TableName');
  }
}
