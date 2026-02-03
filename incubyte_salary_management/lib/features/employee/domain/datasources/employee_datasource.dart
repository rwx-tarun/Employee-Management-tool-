import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeDbService {
  static const _dbName = 'employees.db';
  static const _tableName = 'employees';

  Database? _db;
  final String? testPath; // For testing

  EmployeeDbService({this.testPath});

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = testPath ?? join(await getDatabasesPath(), _dbName);

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            full_name TEXT,
            job_title TEXT,
            country TEXT,
            salary REAL
          )
        ''');
      },
    );
  }

  // ---------- CRUD ----------

  Future<int> insert(Map<String, dynamic> data) async {
    final db = await database;
    return db.insert(_tableName, data);
  }

  Future<List<Map<String, dynamic>>> fetchAll() async {
    final db = await database;
    return db.query(_tableName);
  }

  Future<int> update(Map<String, dynamic> data) async {
    final db = await database;
    return db.update(
      _tableName,
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  Future<int> delete(int id) async {
    final db = await database;
    return db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  // For testing - close and delete database
  Future<void> close() async {
    await _db?.close();
    _db = null;
  }

  Future<void> deleteDatabase() async {
    await close();
    if (testPath != null) {
      await databaseFactory.deleteDatabase(testPath!);
    }
  }
}
