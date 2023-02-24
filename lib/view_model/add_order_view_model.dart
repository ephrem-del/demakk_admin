import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/date_and_time.dart';
import 'package:demakk_admin/objects/order.dart' as order_from_order;
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/customer.dart';
import '../objects/order_type.dart';
import '../objects/priority.dart';

class AddOrderViewModel {
  final BehaviorSubject<List<Customer>> customerList =
      BehaviorSubject<List<Customer>>();
  final BehaviorSubject<Map<String, int>> stalkAmountsController =
      BehaviorSubject<Map<String, int>>();
  AddOrderViewModel() {
    _fetchCustomers();
    _fetchStalkAmounts();
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

  Future<bool> addOrder(
    OrderType type,
    int amount,
    String comment,
    Priority priority,
    String customerId,
    double paid,
    String customerName,
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
    bool isSaved = false;
    try {
      FirebaseFirestore.instance
          .collection('customers')
          .doc(customerId)
          .collection('orders')
          .add(order.toMap());
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
    return isSaved;
  }

  void _fetchStalkAmounts() {
    Map<String, int> stalkAmounts = {};
    try {
      FirebaseFirestore.instance
          .collectionGroup('stalkTypes')
          .snapshots()
          .listen((data) {
        List<_StalkSomething> stalkSomethings =
            data.docs.map((doc) => _StalkSomething.fromSnapshot(doc)).toList();
        stalkAmounts = {
          for (_StalkSomething stalkSomething in stalkSomethings)
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

class _StalkSomething {
  final String name;
  final int amountLeft;
  //final String categoryType;
  _StalkSomething({
    required this.name,
    required this.amountLeft,
    // required this.categoryType
  });

  factory _StalkSomething.fromSnapshot(QueryDocumentSnapshot doc) {
    return _StalkSomething(
      name: doc['typeName'],
      amountLeft: doc['amountLeft'],
      // categoryType: doc['categoryType'],
    );
  }
}
