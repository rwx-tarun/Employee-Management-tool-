import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_event.dart';
import 'package:incubyte_salary_management/features/employee/presentation/ui/EmployeeFormModal.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(employee.fullName),
        subtitle: Text(
          '${employee.jobTitle} • ${employee.country}\nSalary: ${employee.salary}',
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => _editEmployee(context),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<EmployeeBloc>().add(
                  DeleteEmployeeEvent(employee.id!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editEmployee(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => EmployeeFormModal(employee: employee),
    );
  }
}
