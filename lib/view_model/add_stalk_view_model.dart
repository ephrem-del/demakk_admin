import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demakk_admin/objects/stalk_type.dart';
//import 'package:demakk_admin/objects/stalk_type.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/stalkTypeSimplified.dart';
import '../objects/stalk_category.dart';

class AddStalkViewModel {
  AddStalkViewModel() {
    _fetchStalkTypes();
    _fetchStalkCategories();
  }
  final BehaviorSubject<List<StalkTypeSimplified>> stalkTypesController =
      BehaviorSubject<List<StalkTypeSimplified>>();
  final BehaviorSubject<List<StalkCategory>> stalkCategoriesController =
      BehaviorSubject<List<StalkCategory>>();

  Future<bool> addStalk(
      {required String categoryTitle,
      required String stalkType,
      required int amountAdded}) async {
    bool isAdded = false;
    FirebaseFirestore db = FirebaseFirestore.instance;

    QuerySnapshot stalkCategoriesSnapshot =
        await db.collection('stalk_categories').get();
    QuerySnapshot stalkTypesSnapshot =
        await db.collectionGroup('stalkTypes').get();

    List<StalkCategory> stalkCategories = stalkCategoriesSnapshot.docs
        .map((doc) => StalkCategory.fromSnapshot(doc))
        .toList();
    List<StalkTypeSimplified> stalkTypes = stalkTypesSnapshot.docs
        .map((doc) => StalkTypeSimplified.fromSnapshot(doc))
        .toList();
    String selectedStalkCategoryDocId = '';
    String selectedStalkTypeDocId = '';
    for (int i = 0; i < stalkCategories.length; i++) {
      if (stalkCategories[i].categoryTitle == categoryTitle) {
        selectedStalkCategoryDocId = stalkCategories[i].docId;
      }
    }

    for (int i = 0; i < stalkTypes.length; i++) {
      if (stalkTypes[i].name == stalkType) {
        selectedStalkTypeDocId = stalkTypes[i].docId;
      }
    }

    DocumentReference documentReference = db
        .collection('stalk_categories')
        .doc(selectedStalkCategoryDocId)
        .collection('stalkTypes')
        .doc(selectedStalkTypeDocId);
    isAdded = await db.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);

      int increasedAmount = snapshot.get('amountLeft') + amountAdded;

      transaction.update(documentReference, {'amountLeft': increasedAmount});
      return true;
    });
    return isAdded;
  }

  void _fetchStalkCategories() {
    try {
      FirebaseFirestore.instance
          .collection('stalk_categories')
          .snapshots()
          .listen((data) {
        List<StalkCategory> stalkCategories =
            data.docs.map((doc) => StalkCategory.fromSnapshot(doc)).toList();
        stalkCategoriesController.sink.add(stalkCategories);
      });
    } on FirebaseException {
      if (kDebugMode) {
        print('really really trying');
      }
    } catch (e) {
      if (kDebugMode) {
        print('really not even tying');
      }
    }
  }

  void _fetchStalkTypes() {
    try {
      FirebaseFirestore.instance
          .collectionGroup('stalkTypes')
          .snapshots()
          .listen((data) {
        List<StalkTypeSimplified> stalkTypes = data.docs
            .map((doc) => StalkTypeSimplified.fromSnapshot(doc))
            .toList();
        stalkTypesController.sink.add(stalkTypes);
      });
    } on FirebaseException {
      print('tried');
    } catch (e) {
      print('e');
    }
  }
}
