import 'package:cloud_firestore/cloud_firestore.dart';

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
      print(e);
    } catch (e) {
      print(e);
    }
    return isSaved;
  }
}
