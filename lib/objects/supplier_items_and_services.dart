import 'package:cloud_firestore/cloud_firestore.dart';

class SupplierItemsAndServices {
  final String itemOrServiceName;
  final double price;
  final String measurement;
  final bool changed;
  final String id;
  const SupplierItemsAndServices({
    required this.itemOrServiceName,
    required this.price,
    required this.measurement,
    this.changed = false,
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'itemOrServiceName': itemOrServiceName,
      'price': price,
      'measurement': measurement,
      'changed': changed
    };
  }

  factory SupplierItemsAndServices.fromSnapshot(QueryDocumentSnapshot doc) {
    return SupplierItemsAndServices(
      itemOrServiceName: doc['itemOrServiceName'],
      price: doc['price'],
      measurement: doc['measurement'],
      changed: doc['changed'],
      id: doc.id,
    );
  }
}
