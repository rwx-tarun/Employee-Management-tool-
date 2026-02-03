import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';

class AddEmployee {
  final EmployeeRepository repository;

  AddEmployee(this.repository);

  Future<void> call(Employee employee) {
    return repository.addEmployee(employee);
  }
}
