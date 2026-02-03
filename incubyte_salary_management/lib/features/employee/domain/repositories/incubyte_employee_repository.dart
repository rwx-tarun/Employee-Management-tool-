import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';
import 'package:incubyte_salary_management/features/employee/domain/datasources/employee_datasource.dart';
import 'package:incubyte_salary_management/features/employee/domain/models/employee_model.dart';

class IncubyteEmployeeRepository implements EmployeeRepository {
  final EmployeeLocalDataSource localDataSource;

  IncubyteEmployeeRepository(this.localDataSource);

  @override
  Future<List<Employee>> getEmployees() async {
    final result = await localDataSource.getAll();
    return result.map(EmployeeModel.fromMap).toList();
  }

  @override
  Future<void> addEmployee(Employee employee) async {
    await localDataSource.insert(
      EmployeeModel(
        fullName: employee.fullName,
        jobTitle: employee.jobTitle,
        country: employee.country,
        salary: employee.salary,
      ).toMap(),
    );
  }

  @override
  Future<void> updateEmployee(Employee employee) async {
    await localDataSource.update(
      EmployeeModel(
        id: employee.id,
        fullName: employee.fullName,
        jobTitle: employee.jobTitle,
        country: employee.country,
        salary: employee.salary,
      ).toMap(),
    );
  }

  @override
  Future<void> deleteEmployee(int id) {
    return localDataSource.delete(id);
  }
}
