// db_helper.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'model.dart'; // Assuming NGO model is in models.dart

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'ngos.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE ngos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            description TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertNGO(NGO ngo) async {
    final db = await database;
    await db.insert('ngos', ngo.toMap());
  }

  Future<List<NGO>> getNGOs() async {
    final db = await database;
    final List<Map<String, dynamic>> ngoMaps = await db.query('ngos');
    return List.generate(ngoMaps.length, (i) {
      return NGO.fromMap(ngoMaps[i]); // Each NGO now includes an id
    });
  }
  Future<void> deleteNGO(int id) async {
    final db = await database;
    await db.delete(
      'ngos', // Your NGO table name
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
