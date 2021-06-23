import 'dart:async';
import 'package:bil_bakalim/Model/Skor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManagement{
  static Database _db;

  Future<Database> get db async{
    if(_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var dbFolder = await getDatabasesPath();
    String path = join(dbFolder, "BilBakalimDatabase.db");

    return await openDatabase(path, onCreate: _onCreate, version:1);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Skorlar(id INTEGER PRIMARY KEY NOT NULL, adSoyad TEXT, skor INTEGER)");
  }

  Future<List<Skor>> getSkor() async{
    var dbClient = await db;
    var result = await dbClient.query("Skorlar", orderBy: "skor DESC");
    return result.map((data) => Skor.fromMap(data)).toList();
  }

  Future<int> insertItem(Skor skor) async{
    var dbClient = await db;
    return await dbClient.insert("Skorlar", skor.toMap());
  }
}