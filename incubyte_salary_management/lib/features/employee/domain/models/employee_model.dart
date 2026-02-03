import 'package:incubyte_salary_management/features/employee/data/entities/employee.dart';

class EmployeeModel extends Employee {
  const EmployeeModel({
    int? id,
    required String fullName,
    required String jobTitle,
    required String country,
    required double salary,
  }) : super(
         id: id,
         fullName: fullName,
         jobTitle: jobTitle,
         country: country,
         salary: salary,
       );

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      fullName: map['full_name'],
      jobTitle: map['job_title'],
      country: map['country'],
      salary: (map['salary'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'job_title': jobTitle,
      'country': country,
      'salary': salary,
    };
  }
}
