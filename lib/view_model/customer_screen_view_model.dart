// import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../objects/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerScreenViewModel {
  final BehaviorSubject<List<Customer>> customersBehaviorSubjectController =
      BehaviorSubject<List<Customer>>();
  // final StreamController<List<Customer>> customersStream =
  //     StreamController<List<Customer>>();

  CustomerScreenViewModel() {
    _fetchCustomers();
  }

  void initState() {
    _fetchCustomers();
  }

  void _fetchCustomers() async {
    FirebaseFirestore.instance
        .collection('customers')
        .orderBy('name', descending: false)
        .snapshots()
        .listen((data) {
      final customers =
          data.docs.map((doc) => Customer.fromSnapshot(doc)).toList();
      customersBehaviorSubjectController.sink.add(customers);
      //customersStream.sink.add(customers);
    });
  }

  void dispose() {
    //customersStream.close();
    customersBehaviorSubjectController.close();
  }
}
