// import 'package:demakk_admin/objects/supplier_items_and_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Supplier {
  final String companyName;
  final String phoneNumber;
  final String address;
  final String comment;
  final String id;
  //List<SupplierItemsAndServices> supplierItemsAndServices;
  Supplier({
    required this.companyName,
    required this.phoneNumber,
    required this.address,
    required this.comment,
    this.id = '',
    //this.supplierItemsAndServices = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'phoneNumber': phoneNumber,
      'address': address,
      'comment': comment,
// TODO: implement supplierItemsAndServices
    };
  }

  factory Supplier.fromSnapshot(QueryDocumentSnapshot doc) {
    return Supplier(
      companyName: doc['companyName'],
      phoneNumber: doc['phoneNumber'],
      address: doc['address'],
      comment: doc['comment'],
      id: doc.id,
    );
  }
}
