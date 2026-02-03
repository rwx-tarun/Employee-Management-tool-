import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';

class UpdateEmployee {
  final EmployeeRepository repository;

  UpdateEmployee(this.repository);

  Future<void> call(Employee employee) {
    return repository.updateEmployee(employee);
  }
}
