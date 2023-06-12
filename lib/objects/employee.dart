import 'package:cloud_firestore/cloud_firestore.dart';


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

import 'package:demakk_admin/objects/employee_position.dart';

class Employee {
  final String employeeEmail;
  final String name;
  final EmployeePosition employeePosition;
  final String phoneNo;
  Employee(
      {required this.employeeEmail,
      required this.name,
      required this.employeePosition,
      required this.phoneNo});

  factory Employee.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return Employee(
        employeeEmail: snapshot['emplyeeId'],
        name: snapshot['name'],
        employeePosition: EmployeePosition.fromSnapshot(snapshot),
        phoneNo: snapshot['phoneNo']);
  }

  factory Employee.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return Employee(
        employeeEmail: snapshot.id,
        name: snapshot['name'],
        phoneNo: snapshot['phone number'],
        employeePosition: EmployeePosition.fromDocumentSnapshot(snapshot));
  }

  toMap(Employee employee) {
    return {
      'employeeId': employeeEmail,
      'name': name,
      'positionTitle': employeePosition.positionTitle,
      'hourlyRate': employeePosition.hourlyRate,
      'phoneNo': phoneNo,
    };
  }
}
