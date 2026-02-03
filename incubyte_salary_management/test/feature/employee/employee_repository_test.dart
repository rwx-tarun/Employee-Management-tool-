import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';
import 'package:incubyte_salary_management/features/employee/domain/datasources/employee_datasource.dart';
import 'package:incubyte_salary_management/features/employee/domain/repositories/incubyte_employee_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockEmployeeDbService extends Mock implements EmployeeDbService {}

void main() {
  late EmployeeRepository repository;
  late MockEmployeeDbService mockDb;

  setUp(() {
    mockDb = MockEmployeeDbService();
    repository = IncubyteEmployeeRepository(mockDb);
  });

  test('getEmployees should return list of employees', () async {
    when(() => mockDb.fetchAll()).thenAnswer(
      (_) async => [
        {
          'id': 1,
          'full_name': 'John',
          'job_title': 'Engineer',
          'country': 'India',
          'salary': 50000,
        },
      ],
    );

    final employees = await repository.getEmployees();

    expect(employees.length, 1);
    expect(employees.first.fullName, 'John');
  });

  test('addEmployee should call insert', () async {
    final employee = Employee(
      fullName: 'Jane',
      jobTitle: 'HR',
      country: 'USA',
      salary: 45000,
    );

    when(() => mockDb.insert(any())).thenAnswer((_) async => 1);

    await repository.addEmployee(employee);

    verify(() => mockDb.insert(any())).called(1);
  });
}
