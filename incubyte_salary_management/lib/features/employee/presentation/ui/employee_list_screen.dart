import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_state.dart';
import 'package:incubyte_salary_management/features/employee/presentation/ui/EmployeeFormModal.dart';
import 'package:incubyte_salary_management/features/employee/presentation/ui/employee_card.dart';

class EmployeeListScreen extends StatelessWidget {
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employees')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openForm(context),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is EmployeeLoaded) {
            if (state.employees.isEmpty) {
              return const Center(child: Text('No employees found'));
            }

            return ListView.builder(
              itemCount: state.employees.length,
              itemBuilder: (_, index) {
                final employee = state.employees[index];
                return EmployeeCard(employee: employee);
              },
            );
          }

          if (state is EmployeeError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _openForm(BuildContext context, {Employee? employee}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => EmployeeFormModal(employee: employee),
    );
  }
}
