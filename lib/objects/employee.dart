import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/wage_resource.dart';

// class Employee {
//   String name;
//   double hourlyRate;
//   double rating;
//   String docId;
//   UserRole userRole;
//   Employee({
//     required this.name,
//     required this.hourlyRate,
//     required this.rating,
//     this.docId = '',
//     required this.userRole,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'hourly rate': hourlyRate,
//       'rating': rating,
//       'userRole': userRole,
//     };
//   }

//   factory Employee.fromSnapshot(QueryDocumentSnapshot doc) {
//     return Employee(
//       name: doc['name'],
//       hourlyRate: doc['hourly rate'],
//       rating: doc['rating'],
//       docId: doc.id,
//       userRole: doc['userRole'],
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/employee_position.dart';

class Employee {
  final String employeeId;
  final String name;
  final EmployeePosition employeePosition;
  final String phoneNo;
  Employee(
      {required this.employeeId,
      required this.name,
      required this.employeePosition,
      required this.phoneNo});

  factory Employee.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return Employee(
        employeeId: snapshot['emplyeeId'],
        name: snapshot['name'],
        employeePosition: EmployeePosition.fromSnapshot(snapshot),
        phoneNo: snapshot['phoneNo']);
  }

  toMap(Employee employee){
    return {
      'employeeId': employeeId,
      'name': name,
      'positionTitle': employeePosition.positionTitle,
      'hourlyRate': employeePosition.hourlyRate,
      'phoneNo': phoneNo,
    };
  }
}

