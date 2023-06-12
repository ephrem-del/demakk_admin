import 'package:cloud_firestore/cloud_firestore.dart';

import '../objects/employee.dart';

class AttendanceScreenViewModel {
  Query<Map<String, dynamic>> getAttendance(Employee employee) {
    final attendance = FirebaseFirestore.instance
        .collection('employees')
        .doc(employee.employeeEmail)
        .collection('time controller').orderBy('startMorning',descending: true);
    return attendance;
  }
}
