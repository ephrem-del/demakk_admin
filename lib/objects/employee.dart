import 'package:cloud_firestore/cloud_firestore.dart';

import '../resources/wage_resource.dart';

class Employee {
  String name;
  double hourlyRate;
  double rating;
  String docId;
  UserRole userRole;
  Employee({
    required this.name,
    required this.hourlyRate,
    required this.rating,
    this.docId = '',
    required this.userRole,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'hourly rate': hourlyRate,
      'rating': rating,
      'userRole': userRole,
    };
  }

  factory Employee.fromSnapshot(QueryDocumentSnapshot doc) {
    return Employee(
      name: doc['name'],
      hourlyRate: doc['hourly rate'],
      rating: doc['rating'],
      docId: doc.id,
      userRole: doc['userRole'],
    );
  }
}
