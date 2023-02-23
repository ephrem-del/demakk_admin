import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../objects/supplier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SupplierScreenViewModel {
  final BehaviorSubject<List<Supplier>> suppliersBehaviorSubjectController =
      BehaviorSubject<List<Supplier>>();
  // final StreamController<List<Supplier>> supplierStreamController =
  //     StreamController<List<Supplier>>();

  SupplierScreenViewModel() {
    _fetchSuppliers();
  }

  void initState() {
    _fetchSuppliers();
  }

  Future<void> _fetchSuppliers() async {
    FirebaseFirestore.instance
        .collection('suppliers')
        .orderBy('companyName', descending: false)
        .snapshots()
        .listen((snapshot) {
      final List<Supplier> suppliers =
          snapshot.docs.map((doc) => Supplier.fromSnapshot(doc)).toList();
      suppliersBehaviorSubjectController.sink.add(suppliers);
      //supplierStreamController.sink.add(suppliers);
    });
  }

  void disppose() {
    suppliersBehaviorSubjectController.close();
//    supplierStreamController.close();
  }
}
