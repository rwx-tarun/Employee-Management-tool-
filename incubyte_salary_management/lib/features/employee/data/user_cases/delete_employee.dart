import 'package:incubyte_salary_management/features/employee/data/repositories/employee_repository.dart';

class DeleteEmployee {
  final EmployeeRepository repository;

  DeleteEmployee(this.repository);

  Future<void> call(int id) {
    return repository.deleteEmployee(id);
  }
}
