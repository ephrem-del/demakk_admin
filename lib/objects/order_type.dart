import 'package:cloud_firestore/cloud_firestore.dart';

class OrderType {
  String name;
  String amharicName;
  double price;
  String category;
  OrderType(
      {required this.name,
      required this.price,
      required this.amharicName,
      this.category = ''});

  factory OrderType.fromSnapshot(QueryDocumentSnapshot doc) {
    return OrderType(
        name: doc['name'],
        price: double.parse('${doc['price']}'),
        amharicName: doc['amharicName'],
        category: doc['category']);
  }
}
