import 'package:flutter_test/flutter_test.dart';
import 'package:incubyte_salary_management/features/employee/domain/models/employee_model.dart';

void main() {
  test('EmployeeModel toMap and fromMap should work correctly', () {
    final employee = EmployeeModel(
      id: 1,
      fullName: 'John Doe',
      jobTitle: 'Engineer',
      country: 'India',
      salary: 50000,
    );

    final map = employee.toMap();
    final fromMap = EmployeeModel.fromMap(map);

    expect(fromMap.id, employee.id);
    expect(fromMap.fullName, employee.fullName);
    expect(fromMap.jobTitle, employee.jobTitle);
    expect(fromMap.country, employee.country);
    expect(fromMap.salary, employee.salary);
  });
}
