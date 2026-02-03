import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';

abstract class EmployeeEvent {
  const EmployeeEvent();
}

class LoadEmployees extends EmployeeEvent {
  const LoadEmployees();
}

class AddEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  const AddEmployeeEvent(this.employee);
}

class UpdateEmployeeEvent extends EmployeeEvent {
  final Employee employee;

  const UpdateEmployeeEvent(this.employee);
}

/// Delete employee by id
class DeleteEmployeeEvent extends EmployeeEvent {
  final int id;

  const DeleteEmployeeEvent(this.id);
}
