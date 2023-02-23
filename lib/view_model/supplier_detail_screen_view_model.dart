import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/supplier_items_and_services.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/supplier.dart';

class SupplierDetailScreenViewModel {
  final BehaviorSubject<List<SupplierItemsAndServices>>
      suppliersDetailBehaviorSubjectController =
      BehaviorSubject<List<SupplierItemsAndServices>>();
  final Supplier supplier;
  SupplierDetailScreenViewModel({required this.supplier}) {
    _fetchSupplierDetails();
  }

  Future<void> _fetchSupplierDetails() async {
    FirebaseFirestore.instance
        .collection('suppliers')
        .doc(supplier.id)
        .collection('itemsAndServices')
        .snapshots()
        .listen((snapshot) {
      final List<SupplierItemsAndServices> supplierItemsAndServices =
          snapshot.docs
              .where((doc) {
                return doc['changed'] == false;
              })
              .map((doc) => SupplierItemsAndServices.fromSnapshot(doc))
              .toList();
      suppliersDetailBehaviorSubjectController.sink
          .add(supplierItemsAndServices);
    });
  }

  Future<void> deleteItem(SupplierItemsAndServices supplierItem) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final secureSnapshot = await transaction.get(FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supplier.id)
          .collection('itemsAndServices')
          .doc(supplierItem.id));
      transaction.update(secureSnapshot.reference, {'changed': true});
    });
  }

  Future<void> updateItem(
      SupplierItemsAndServices supplierItem, String newPrice) async {
    Future<bool> added = _addItem(supplierItem, newPrice);
    if (await added) {
      try {
        await FirebaseFirestore.instance.runTransaction((transaction) async {
          final secureSnapshot = await transaction.get(FirebaseFirestore
              .instance
              .collection('suppliers')
              .doc(supplier.id)
              .collection('itemsAndServices')
              .doc(supplierItem.id));
          transaction.update(secureSnapshot.reference, {'changed': true});
        });
      } on FirebaseException catch (e) {
        if (kDebugMode) {
          print('here is the error: $e}');
        }
      } catch (e) {
        if (kDebugMode) {
          print('here is the error: $e');
        }
      }
    }
  }

  Future<bool> _addItem(supplierItem, String newPrice) async {
    bool isUpdated = false;
    try {
      SupplierItemsAndServices newSupplierItem = SupplierItemsAndServices(
          itemOrServiceName: supplierItem.itemOrServiceName,
          price: double.parse(newPrice),
          measurement: supplierItem.measurement,
          changed: false);
      await FirebaseFirestore.instance
          .collection('suppliers')
          .doc(supplier.id)
          .collection('itemsAndServices')
          .add(newSupplierItem.toMap());
      isUpdated = true;
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print('here is the error: $e}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('here is the error: $e');
      }
    }
    return isUpdated;
  }

  void dispose() {
    suppliersDetailBehaviorSubjectController.close();
  }
}
