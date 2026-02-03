import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_salary_management/features/employee/domain/datasources/employee_datasource.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late EmployeeDbService dbService;

  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  setUp(() {
    // Use in-memory database for each test
    dbService = EmployeeDbService(testPath: inMemoryDatabasePath);
  });

  tearDown(() async {
    await dbService.close();
  });

  test('should insert and fetch employee', () async {
    final id = await dbService.insert({
      'full_name': 'Alice',
      'job_title': 'Manager',
      'country': 'USA',
      'salary': 70000,
    });

    final result = await dbService.fetchAll();

    expect(result.length, 1);
    expect(result.first['id'], id);
    expect(result.first['full_name'], 'Alice');
  });

  test('should update employee', () async {
    final id = await dbService.insert({
      'full_name': 'Bob',
      'job_title': 'Developer',
      'country': 'India',
      'salary': 60000,
    });

    await dbService.update({
      'id': id,
      'full_name': 'Bob Updated',
      'job_title': 'Senior Developer',
      'country': 'India',
      'salary': 80000,
    });

    final result = await dbService.fetchAll();

    expect(result.first['full_name'], 'Bob Updated');
    expect(result.first['salary'], 80000);
  });

  test('should delete employee', () async {
    final id = await dbService.insert({
      'full_name': 'Charlie',
      'job_title': 'Designer',
      'country': 'UK',
      'salary': 55000,
    });

    await dbService.delete(id);

    final result = await dbService.fetchAll();
    expect(result, isEmpty);
  });
}
