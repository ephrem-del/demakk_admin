import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../objects/supplier.dart';

class AddSupplierViewModel {
  Future<bool> addSupplier(companyName, address, phoneNumber, comment) async {
    bool isSaved = false;
    Supplier supplier = Supplier(
        companyName: companyName,
        phoneNumber: phoneNumber,
        address: address,
        comment: comment);
    try {
      FirebaseFirestore.instance.collection('suppliers').add(supplier.toMap());
      isSaved = true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return isSaved;
  }
}
