// ignore_for_file: avoid_print

import 'package:hirehub/models/jobModels/AppliedJobs.dart';
import 'package:sqflite/sqflite.dart';

class JobHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _dbName = 'hirehub';
  static const String _tableName = 'appliedJobs';

  static Future<void> initDb() async {
    if (_db != null) {
      print("DB already Created");
      return;
    }

    try {
      String _path = await getDatabasesPath() + "hirehub.db";
      _db =
          await openDatabase(_path, version: _version, onCreate: (db, version) {
        print("New DB Created");

        return db.execute(
            "CREATE TABLE $_tableName(id STRING PRIMARY KEY, title STRING, companyName STRING,companyCountry STRING,companyRegion STRING,  appliedDate STRING, status STRING)");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(AppliedJob event) async {
    print("Insert Function called");
    return await _db?.insert(_tableName, event.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Query Function called");
    return await _db!.query(_tableName);
  }

  static delete(AppliedJob event) async {
    print("Delete Function called");
    return await _db
        ?.delete(_tableName, where: "id = ?", whereArgs: [event.id]);
  }

  static deleteAll() async {
    print("Delete All Function called");
    return await _db?.execute("DELETE FROM $_tableName");
  }

  static update(int id, String status) async {
    print("Update Function called");
    return await _db!.rawUpdate('''
    UPDATE appliedJobs
    SET status = ?
    WHERE id = ?
''', [status, id]);
  }
}
