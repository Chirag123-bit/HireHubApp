// ignore_for_file: avoid_print

import 'package:hirehub/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class TodoHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _dbName = 'hirehub';
  static const String _tableName = 'todos';

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
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, color INTEGER,  isCompleted INTEGER)");
      });
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Todo event) async {
    print("Insert Function called");
    return await _db?.insert(_tableName, event.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("Query Function called");
    return await _db!.query(_tableName);
  }

  static delete(Todo event) async {
    print("Delete Function called");
    return await _db
        ?.delete(_tableName, where: "id = ?", whereArgs: [event.id]);
  }

  static update(int id) async {
    print("Update Function called");
    return await _db!.rawUpdate('''
    UPDATE todos
    SET isCompleted = ?
    WHERE id = ?
''', [1, id]);
  }
}
