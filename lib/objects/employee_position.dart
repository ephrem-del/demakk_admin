import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeePosition {
  final String positionTitle;
  final double hourlyRate;
  EmployeePosition({required this.positionTitle, required this.hourlyRate});

  factory EmployeePosition.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return EmployeePosition(
        positionTitle: snapshot['positionTitle'],
        hourlyRate: snapshot['hourlyRate']);
  }

  toMap(EmployeePosition employeePosition) {
    return {
      'positionTitle': positionTitle,
      'hourlyRate': hourlyRate,
    };
  }
}