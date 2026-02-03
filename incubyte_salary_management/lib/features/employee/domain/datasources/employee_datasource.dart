import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class EmployeeLocalDataSource {
  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final path = join(await getDatabasesPath(), 'employees.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE employees(
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

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await database;
    return db.query('employees');
  }

  Future<void> insert(Map<String, dynamic> data) async {
    final db = await database;
    await db.insert('employees', data);
  }

  Future<void> update(Map<String, dynamic> data) async {
    final db = await database;
    await db.update(
      'employees',
      data,
      where: 'id = ?',
      whereArgs: [data['id']],
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await db.delete('employees', where: 'id = ?', whereArgs: [id]);
  }
}
