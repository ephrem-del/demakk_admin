import 'package:cloud_firestore/cloud_firestore.dart';

import 'employee.dart';

class EmployeeTime {
  late final DateTime date;
  final DateTime time;
  final Employee employee;
  late final String timeName;
  final bool inOrOut;
  EmployeeTime(
      {required this.time, required this.employee, required this.inOrOut}) {
    timeName = inOrOut ? '${employee.name}In' : '${employee.name}Out';
    date = DateTime.now()
        .subtract(
          Duration(
              hours: DateTime.now().hour,
              minutes: DateTime.now().minute,
              seconds: DateTime.now().second),
        )
        .add(const Duration(hours: 8));
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      timeName: time,
    };
  }

  factory EmployeeTime.fromSnapshot(
      QueryDocumentSnapshot doc, Employee employee, bool inOrOut) {
    return EmployeeTime(
        time: doc[inOrOut ? '${employee.name}In' : '${employee.name}Out'],
        employee: employee,
        inOrOut: inOrOut);
  }
}
