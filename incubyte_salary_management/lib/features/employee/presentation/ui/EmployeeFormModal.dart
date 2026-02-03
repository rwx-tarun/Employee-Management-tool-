import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_bloc.dart';
import 'package:incubyte_salary_management/features/employee/presentation/bloc/employee_event.dart';

class EmployeeFormModal extends StatefulWidget {
  final Employee? employee;

  const EmployeeFormModal({super.key, this.employee});

  @override
  State<EmployeeFormModal> createState() => _EmployeeFormModalState();
}

class _EmployeeFormModalState extends State<EmployeeFormModal> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameController;
  late final TextEditingController _jobController;
  late final TextEditingController _countryController;
  late final TextEditingController _salaryController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(
      text: widget.employee?.fullName ?? '',
    );
    _jobController = TextEditingController(
      text: widget.employee?.jobTitle ?? '',
    );
    _countryController = TextEditingController(
      text: widget.employee?.country ?? '',
    );
    _salaryController = TextEditingController(
      text: widget.employee?.salary.toString() ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.employee == null ? 'Add Employee' : 'Edit Employee',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _buildField(_nameController, 'Full Name'),
            _buildField(_jobController, 'Job Title'),
            _buildField(_countryController, 'Country'),
            _buildField(
              _salaryController,
              'Salary',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submit, child: const Text('Save')),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    TextEditingController controller,
    String label, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final employee = Employee(
      id: widget.employee?.id,
      fullName: _nameController.text,
      jobTitle: _jobController.text,
      country: _countryController.text,
      salary: double.parse(_salaryController.text),
    );

    final bloc = context.read<EmployeeBloc>();

    if (widget.employee == null) {
      bloc.add(AddEmployeeEvent(employee));
    } else {
      bloc.add(UpdateEmployeeEvent(employee));
    }

    Navigator.pop(context);
  }
}
