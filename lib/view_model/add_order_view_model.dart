import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/date_and_time.dart';
import 'package:demakk_admin/objects/order.dart' as order_from_order;
import 'package:demakk_admin/objects/stalk_category.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/customer.dart';
import '../objects/order_type.dart';
import '../objects/priority.dart';
import '../objects/stalkTypeSimplified.dart';

class AddOrderViewModel {
  final BehaviorSubject<List<Customer>> customerList =
      BehaviorSubject<List<Customer>>();
  final BehaviorSubject<Map<String, int>> stalkAmountsController =
      BehaviorSubject<Map<String, int>>();
  final BehaviorSubject<List<OrderType>> mugTypesController =
      BehaviorSubject<List<OrderType>>();
  AddOrderViewModel() {
    _fetchCustomers();
    _fetchStalkAmounts();
    _fetchMugTypes();
  }

  Future<void> _fetchMugTypes() async {
    FirebaseFirestore.instance
        .collection('allOrderTypes')
        .where('category', isEqualTo: 'Mug')
        .snapshots()
        .listen((data) {
      List<OrderType> mugTypes =
          data.docs.map((doc) => OrderType.fromSnapshot(doc)).toList();
      mugTypesController.sink.add(mugTypes);
    });
  }

  Future<void> _fetchCustomers() async {
    FirebaseFirestore.instance
        .collection('customers')
        .orderBy('name', descending: false)
        .snapshots()
        .listen((snapshot) {
      List<Customer> customers =
          snapshot.docs.map((doc) => Customer.fromSnapshot(doc)).toList();
      customerList.sink.add(customers);
    });
  }

  List<StalkCategory> stalkCategories = [];
  String categoryDocumentId = '';

  Future<bool> addOrder(
    OrderType type,
    int amount,
    String comment,
    Priority priority,
    String customerId,
    double paid,
    String customerName,
    String categoryType,
  ) async {
    order_from_order.Order order = order_from_order.Order(
      type: type,
      amount: amount,
      comment: comment,
      priority: priority,
      customerId: customerId,
      completed: false,
      paid: paid,
      customerName: customerName,
      dateAndTime: DateAndTime(
        dateTime: DateTime.now(),
      ),
    );

    final unpaid = amount * type.price - paid;

    bool isSaved = false;

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('stalk_categories').get();
    stalkCategories = querySnapshot.docs
        .map((doc) => StalkCategory.fromSnapshot(doc))
        .toList();

    print('categoryType: $categoryType');

    for (int i = 0; i < stalkCategories.length; i++) {
      print('at index $i categoryTitle: ${stalkCategories[i].categoryTitle}');
      if (stalkCategories[i].categoryTitle == categoryType) {
        categoryDocumentId = stalkCategories[i].docId;
        print(stalkCategories[i].categoryTitle);
      }
    }

    bool stalkUpdated = await _updateStalk(
      categoryType: categoryType,
      type: type,
      stalkDecreased: amount,
      categoryDocumentId: categoryDocumentId,
    );
    if (stalkUpdated) {
      try {
        FirebaseFirestore.instance
            .collection('customers')
            .doc(customerId)
            .collection('orders')
            .add(order.toMap());

        final documentReference =
            FirebaseFirestore.instance.collection('customers').doc(customerId);
        FirebaseFirestore.instance.runTransaction((transaction) async {
          final snapshot = await transaction.get(documentReference);
          final paymentLeft = snapshot.get('paymentLeft') + unpaid;
          transaction.update(documentReference, {'paymentLeft': paymentLeft});
        });

        isSaved = true;
        if (kDebugMode) {
          print('trying really trying');
        }
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

    return isSaved;
  }

  Future<bool> _updateStalk({
    required String categoryType,
    required OrderType type,
    required int stalkDecreased,
    required String categoryDocumentId,
  }) async {
    String stalkTypeDocId = '';
    categoryDocumentId = categoryDocumentId;
    print(categoryDocumentId);

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('stalk_categories')
        .doc(categoryDocumentId)
        .collection('stalkTypes')
        .get();
    List<StalkTypeSimplified> stalkTypes = querySnapshot.docs
        .map((doc) => StalkTypeSimplified.fromSnapshot(doc))
        .toList();
    for (int i = 0; i < stalkTypes.length; i++) {
      print(stalkTypes[i].name);
      print(type.name);
      if (stalkTypes[i].name == type.name) {
        stalkTypeDocId = stalkTypes[i].docId;
      }
    }

    final databaseReference = FirebaseFirestore.instance
        .collection('stalk_categories')
        .doc(categoryDocumentId)
        .collection('stalkTypes')
        .doc(stalkTypeDocId); //HERE IS THE PROBLEM
    bool isAdded =
        await FirebaseFirestore.instance.runTransaction((transaction) async {
      final snapshot = await transaction.get(databaseReference);
      final newAmountLeft = snapshot.get('amountLeft') - stalkDecreased;
      transaction.update(databaseReference, {'amountLeft': newAmountLeft});
      return true;
    });
    return isAdded;
  }

  void _fetchStalkAmounts() {
    Map<String, int> stalkAmounts = {};
    try {
      FirebaseFirestore.instance
          .collectionGroup('stalkTypes')
          .snapshots()
          .listen((data) {
        List<StalkTypeSimplified> stalkSomethings = data.docs
            .map((doc) => StalkTypeSimplified.fromSnapshot(doc))
            .toList();
        stalkAmounts = {
          for (StalkTypeSimplified stalkSomething in stalkSomethings)
            stalkSomething.name: stalkSomething.amountLeft
        };
        stalkAmountsController.sink.add(stalkAmounts);
      });
    } on FirebaseException {
      if (kDebugMode) {
        print(
            'firebase exception eroooooooooooooooooooooooooooooooooooooooooooooooor');
      }
    } catch (e) {
      if (kDebugMode) {
        print('eroooooooooooooooooooooooooooooooooooooooor');
      }
    }

    //return stalkAmounts;
  }
}
