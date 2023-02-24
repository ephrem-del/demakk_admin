import 'package:cloud_firestore/cloud_firestore.dart';

class StalkCategory {
  final String categoryTitle;
  final String amharicCategoryTitle;
  final String docId;
  const StalkCategory(
      {required this.categoryTitle,
      required this.amharicCategoryTitle,
      this.docId = ''});

  Map<String, String> toMap(StalkCategory stalkCategory) {
    return {
      'categoryTitle': stalkCategory.categoryTitle,
      'amharicCategoryTitle': stalkCategory.amharicCategoryTitle,
    };
  }

  factory StalkCategory.fromSnapshot(QueryDocumentSnapshot doc) {
    return StalkCategory(
      categoryTitle: doc['categoryTitle'],
      amharicCategoryTitle: doc['amharicCategoryTitle'],
      docId: doc.id,
    );
  }
}
