# 💼 Incubyte Salary Management

> A Flutter application for managing employee salary records with SQLite database integration and comprehensive test coverage.

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Project Structure](#-project-structure)
- [Test Coverage](#-test-coverage)
- [Getting Started](#-getting-started)
- [Running Tests](#-running-tests)
- [Architecture](#-architecture)
- [Code Examples](#-code-examples)
- [Contributing](#-contributing)

---

## 🎯 Overview

This project demonstrates a **clean architecture** approach to building a Flutter application with local database persistence using SQLite. It showcases best practices in:

- 🏗️ Clean Architecture pattern
- 🧪 Comprehensive unit testing
- 💾 SQLite database integration
- 🎭 Repository pattern implementation

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 📝 **CRUD Operations** | Create, Read, Update, Delete employee records |
| 💾 **SQLite Integration** | Persistent local database storage |
| 🏛️ **Clean Architecture** | Separation of concerns with repository pattern |
| 🧪 **Test Coverage** | Comprehensive unit tests for all layers |
| 🚀 **In-Memory Testing** | Fast, isolated database tests |

---

## 🏗️ Project Structure
```
lib/
└── features/
    └── employee/
        ├── data/
        │   ├── entities/
        │   │   └── employee.dart                    # Domain entity
        │   └── repositories/
        │       └── employee_repository.dart         # Repository interface
        └── domain/
            ├── datasources/
            │   └── employee_datasource.dart         # SQLite service
            ├── models/
            │   └── employee_model.dart              # Data transfer object
            └── repositories/
                └── incubyte_employee_repository.dart # Repository implementation

test/
└── features/
    └── employee/
        ├── domain/
        │   ├── datasources/
        │   │   └── employee_datasource_test.dart    # Database tests
        │   ├── models/
        │   │   └── employee_model_test.dart         # Model tests
        │   └── repositories/
        │       └── incubyte_employee_repository_test.dart # Repository tests
```

---

## 🧪 Test Coverage

The project includes **3 comprehensive test suites** covering all layers:

### 1️⃣ Database Layer Tests
**File:** `employee_datasource_test.dart`

Tests SQLite database operations with in-memory database:
```dart
✅ Insert and fetch employees
✅ Update employee records  
✅ Delete employee records
```

**Key Features:**
- Uses `sqflite_common_ffi` for testing
- In-memory database for fast execution
- Isolated test environment

---

### 2️⃣ Repository Layer Tests
**File:** `incubyte_employee_repository_test.dart`

Tests repository pattern implementation with mocks:
```dart
✅ Fetching employees through repository
✅ Adding employees through repository
✅ Proper abstraction and dependency injection
```

**Key Features:**
- Uses `mocktail` for mocking
- Tests business logic isolation
- Validates repository contract

---

### 3️⃣ Model Tests
**File:** `employee_model_test.dart`

Tests data model serialization and deserialization:
```dart
✅ toMap() conversion
✅ fromMap() conversion
✅ Data integrity validation
```

**Key Features:**
- Ensures proper data transformation
- Validates field mapping
- Type safety verification

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (3.0 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/yourusername/incubyte_salary_management.git
   cd incubyte_salary_management
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Run the app**
```bash
   flutter run
```

---

## 🧪 Running Tests

### Run all tests
```bash
flutter test
```

### Run specific test file
```bash
flutter test test/features/employee/domain/datasources/employee_datasource_test.dart
```

### Run tests with coverage
```bash
flutter test --coverage
```

### View coverage report
```bash
# Generate HTML report (requires lcov)
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 📦 Dependencies

### Main Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `sqflite` | ^2.0.0 | SQLite database integration |
| `path` | ^1.8.0 | Path manipulation utilities |

### Dev Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `flutter_test` | sdk | Testing framework |
| `mocktail` | ^1.0.0 | Mocking library |
| `sqflite_common_ffi` | ^2.0.0 | SQLite FFI for testing |

---

## 🏛️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:
```
┌─────────────────────────────────────────────┐
│         Presentation Layer (Future)         │
│  ┌─────────────────────────────────────┐   │
│  │   UI Components & State Management  │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────┐
│            Domain Layer                      │
│  ┌─────────────────────────────────────┐   │
│  │  Business Logic & Repository        │   │
│  │  Interfaces (EmployeeRepository)    │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
                     ↓
┌─────────────────────────────────────────────┐
│             Data Layer                       │
│  ┌─────────────────────────────────────┐   │
│  │  Database Operations & Entities     │   │
│  │  (EmployeeDbService)                │   │
│  └─────────────────────────────────────┘   │
└─────────────────────────────────────────────┘
```

### Key Components

| Component | Responsibility |
|-----------|----------------|
| **EmployeeDbService** | Direct SQLite database operations |
| **EmployeeRepository** | Abstract repository interface |
| **IncubyteEmployeeRepository** | Concrete repository implementation |
| **Employee** | Domain entity |
| **EmployeeModel** | Data transfer object |

---

## 📊 Employee Schema
```sql
CREATE TABLE employees (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  full_name TEXT NOT NULL,
  job_title TEXT NOT NULL,
  country TEXT NOT NULL,
  salary REAL NOT NULL
);
```

---

## 💻 Code Examples

### Adding an Employee
```dart
final employee = Employee(
  fullName: 'Jane Doe',
  jobTitle: 'Software Engineer',
  country: 'USA',
  salary: 75000,
);

await repository.addEmployee(employee);
```

### Fetching All Employees
```dart
final employees = await repository.getEmployees();

for (var employee in employees) {
  print('${employee.fullName} - ${employee.jobTitle}');
}
```

### Updating an Employee
```dart
await dbService.update({
  'id': 1,
  'full_name': 'John Updated',
  'job_title': 'Senior Developer',
  'country': 'India',
  'salary': 80000,
});
```

### Deleting an Employee
```dart
await dbService.delete(employeeId);
```

---


### Current Coverage

- ✅ **Unit Tests**: Testing individual components in isolation
- ✅ **Mock Objects**: Using `mocktail` for dependency mocking
- ✅ **In-Memory Database**: Fast, isolated SQLite tests
- ✅ **Test Isolation**: Fresh database per test

---
