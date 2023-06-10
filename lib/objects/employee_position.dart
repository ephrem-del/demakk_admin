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

  factory EmployeePosition.fromDocumentSnapshot(DocumentSnapshot snapshot){
    return EmployeePosition(
      positionTitle: snapshot['position title'],
      hourlyRate: double.parse(snapshot['hourly rate'].toString()), //snapshot['hourly rate'],
    );
  }

  toMap(EmployeePosition employeePosition) {
    return {
      'positionTitle': positionTitle,
      'hourlyRate': hourlyRate,
    };
  }
}