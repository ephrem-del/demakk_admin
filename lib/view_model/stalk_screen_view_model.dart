import 'package:demakk_admin/objects/stalk_category.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StalkScreenViewModel {
  StalkScreenViewModel() {
    _fetchStalks();
  }
  BehaviorSubject<List<StalkCategory>> stalkCategoriesController =
      BehaviorSubject<List<StalkCategory>>();

  _fetchStalks() {
    try {
      FirebaseFirestore.instance
          .collection('stalk_categories')
          .snapshots()
          .listen((data) {
        List<StalkCategory> stalkCategories =
            data.docs.map((doc) => StalkCategory.fromSnapshot(doc)).toList();
        stalkCategoriesController.sink.add(stalkCategories);
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
