import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/stalk_category.dart';
import 'package:demakk_admin/objects/stalk_type.dart';

class Stalk {
  StalkType stalkType;
  int amountLeft;
  Stalk({required this.stalkType, required this.amountLeft});

  Map<String, dynamic> toMap(Stalk stalk) {
    return {
      'amharicTypeName': stalk.stalkType.amharicTypeName,
      'typeName': stalk.stalkType.typeName,
      'price': stalk.stalkType.price,
      'amountLeft': stalk.amountLeft,
    };
  }

  factory Stalk.fromSnapshot(
      QueryDocumentSnapshot doc, StalkCategory stalkCategory) {
    return Stalk(
      stalkType: StalkType(
          typeName: doc['typeName'],
          price: doc['price'],
          stalkCategory: stalkCategory,
          amharicTypeName: doc['amharicTypeName']),
      amountLeft: doc['amountLeft'],
    );
  }
}
