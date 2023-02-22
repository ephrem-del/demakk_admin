import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String name;
  String phoneNumber;
  String address;
  double paymentLeft;
  String? id;
  Customer(
      {required this.name,
      required this.phoneNumber,
      required this.address,
      this.paymentLeft = 0.0,
      this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'paymentLeft': paymentLeft,
    };
  }

  factory Customer.fromSnapshot(QueryDocumentSnapshot doc) {
    return Customer(
        name: doc['name'],
        phoneNumber: doc['phoneNumber'],
        address: doc['address'],
        paymentLeft: doc['paymentLeft'],
        id: doc.id);
  }
}
