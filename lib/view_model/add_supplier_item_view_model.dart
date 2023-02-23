import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/supplier_items_and_services.dart';
import 'package:flutter/foundation.dart';

import '../objects/supplier.dart';

class AddSupplierItemViewModel {
  Future<bool> addSupplierItem(
      {required Supplier supplier,
      required String itemOrServiceName,
      required String price,
      required String measurement}) async {
    bool isSaved = false;
    try {
      await FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supplier.id)
          .collection('itemsAndServices')
          .add(SupplierItemsAndServices(
                  itemOrServiceName: itemOrServiceName,
                  price: double.parse(price),
                  measurement: measurement)
              .toMap());
      isSaved = true;
      return isSaved;
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
