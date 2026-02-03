import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';

abstract class EmployeeState {
  const EmployeeState();
}

class EmployeeInitial extends EmployeeState {
  const EmployeeInitial();
}

class EmployeeLoading extends EmployeeState {
  const EmployeeLoading();
}

class EmployeeLoaded extends EmployeeState {
  final List<Employee> employees;

  const EmployeeLoaded(this.employees);
}

class EmployeeError extends EmployeeState {
  final String message;

  const EmployeeError(this.message);
}
