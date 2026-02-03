import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubyte_salary_management/features/employee/data/user_cases/add_employee.dart';
import 'package:incubyte_salary_management/features/employee/data/user_cases/delete_employee.dart';
import 'package:incubyte_salary_management/features/employee/data/user_cases/get_employees.dart';
import 'package:incubyte_salary_management/features/employee/data/user_cases/update_employee.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_event.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final GetEmployees getEmployees;
  final AddEmployee addEmployee;
  final UpdateEmployee updateEmployee;
  final DeleteEmployee deleteEmployee;

  EmployeeBloc({
    required this.getEmployees,
    required this.addEmployee,
    required this.updateEmployee,
    required this.deleteEmployee,
  }) : super(const EmployeeInitial()) {
    on<LoadEmployees>((_, emit) async {
      emit(const EmployeeLoading());
      final employees = await getEmployees();
      emit(EmployeeLoaded(employees));
    });

    on<AddEmployeeEvent>((event, _) async {
      await addEmployee(event.employee); // ✅ invoke
      add(const LoadEmployees());
    });

    on<UpdateEmployeeEvent>((event, _) async {
      await updateEmployee(event.employee); // ✅ invoke
      add(const LoadEmployees());
    });

    on<DeleteEmployeeEvent>((event, _) async {
      await deleteEmployee(event.id); // ✅ invoke
      add(const LoadEmployees());
    });
  }
}
