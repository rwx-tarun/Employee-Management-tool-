Incubyte Salary Management
A Flutter application for managing employee salary records with SQLite database integration.
📋 Overview
This project demonstrates a clean architecture approach to building a Flutter application with local database persistence using SQLite. It includes comprehensive test coverage for database operations, repository layer, and data models.
✨ Features

Employee CRUD operations (Create, Read, Update, Delete)
SQLite database integration
Clean architecture with repository pattern
Comprehensive unit tests
In-memory database testing

🏗️ Project Structure
lib/
└── features/
    └── employee/
        ├── data/
        │   ├── entities/
        │   │   └── employee.dart
        │   └── repositories/
        │       └── employee_repository.dart
        └── domain/
            ├── datasources/
            │   └── employee_datasource.dart
            ├── models/
            │   └── employee_model.dart
            └── repositories/
                └── incubyte_employee_repository.dart
🧪 Test Coverage
The project includes 3 comprehensive test suites:
1. Database Layer Tests (employee_datasource_test.dart)
Tests the SQLite database operations:

✅ Insert and fetch employees
✅ Update employee records
✅ Delete employee records

2. Repository Layer Tests (incubyte_employee_repository_test.dart)
Tests the repository pattern implementation:

✅ Fetching employees through repository
✅ Adding employees through repository
✅ Proper abstraction and mocking

3. Model Tests (employee_model_test.dart)
Tests data model serialization:

✅ toMap() conversion
✅ fromMap() conversion
✅ Data integrity validation

🚀 Getting Started
Prerequisites

Flutter SDK (3.0 or higher)
Dart SDK (3.0 or higher)

Installation

Clone the repository:

bashgit clone https://github.com/yourusername/incubyte_salary_management.git
cd incubyte_salary_management

Install dependencies:

bashflutter pub get

Run the app:

bashflutter run
🧪 Running Tests
Run all tests:
bashflutter test
Run specific test file:
bashflutter test test/features/employee/domain/datasources/employee_datasource_test.dart
Run tests with coverage:
bashflutter test --coverage
