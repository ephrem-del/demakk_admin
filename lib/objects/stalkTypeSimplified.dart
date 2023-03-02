import 'package:cloud_firestore/cloud_firestore.dart';

class StalkTypeSimplified {
  final String name;
  final int amountLeft;
  final String categoryTitle;
  final String docId;
  //final String categoryType;
  StalkTypeSimplified({
    required this.name,
    required this.amountLeft,
    this.categoryTitle = '',
    this.docId = '',
  });

  factory StalkTypeSimplified.fromSnapshot(QueryDocumentSnapshot doc) {
    return StalkTypeSimplified(
      name: doc['typeName'],
      amountLeft: doc['amountLeft'],
      categoryTitle: doc['categoryTitle'],
      docId: doc.id,
    );
  }
}
