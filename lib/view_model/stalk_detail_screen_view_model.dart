import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/stalk.dart';
import '../objects/stalk_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StalkDetailScreenViewModel {
  final StalkCategory stalkCategory;
  StalkDetailScreenViewModel({required this.stalkCategory}) {
    _fetchStalks();
  }

  BehaviorSubject<List<Stalk>> stalksController =
      BehaviorSubject<List<Stalk>>();

  void _fetchStalks() {
    try {
      FirebaseFirestore.instance
          .collection('stalk_categories')
          .doc(stalkCategory.docId)
          .collection('stalkTypes')
          .snapshots()
          .listen((data) {
        List<Stalk> _stalks = data.docs
            .map((doc) => Stalk.fromSnapshot(doc, stalkCategory))
            .toList();
        stalksController.sink.add(_stalks);
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
