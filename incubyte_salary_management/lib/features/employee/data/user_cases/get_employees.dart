import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';

class GetEmployees {
  final EmployeeRepository repository;

  GetEmployees(this.repository);

  Future<List<Employee>> call() {
    return repository.getEmployees();
  }
}
