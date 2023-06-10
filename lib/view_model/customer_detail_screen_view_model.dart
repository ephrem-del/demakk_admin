import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

import '../objects/customer.dart';
import '../objects/order.dart' as CustomOrder;
import '../objects/order_type.dart';

class CustomerDetailScreenViewModel {
  final Customer customer;
  CustomerDetailScreenViewModel({required this.customer}) {
    _fetchTodaysOrders();
    _fetchWeeklyOrders();
    _fetchAllOrders();
  }

  BehaviorSubject<List<CustomOrder.Order>> todaysOrdersController =
      BehaviorSubject<List<CustomOrder.Order>>();
  BehaviorSubject<List<CustomOrder.Order>> weeklyOrdersController =
      BehaviorSubject<List<CustomOrder.Order>>();
  BehaviorSubject<List<CustomOrder.Order>> allOrdersController =
      BehaviorSubject<List<CustomOrder.Order>>();

  FirebaseFirestore database = FirebaseFirestore.instance;

  DateTime dateTimeForToday = DateTime.now().subtract(
      Duration(hours: DateTime.now().hour, minutes: DateTime.now().minute));

  // void initState() {
  //   customerDocumentId = customer.id!;
  // }

  DateTime getWeeklyDate() {
    if (DateTime.now().weekday == 7) {
      return DateTime.now().subtract(
        Duration(
            days: 6,
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second),
      );
    } else if (DateTime.now().weekday == 6) {
      return DateTime.now().subtract(Duration(
          days: 5,
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    } else if (DateTime.now().weekday == 5) {
      return DateTime.now().subtract(Duration(
          days: 4,
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    } else if (DateTime.now().weekday == 4) {
      return DateTime.now().subtract(Duration(
          days: 3,
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    } else if (DateTime.now().weekday == 3) {
      return DateTime.now().subtract(Duration(
          days: 2,
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    } else if (DateTime.now().weekday == 2) {
      return DateTime.now().subtract(Duration(
          days: 1,
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    } else {
      return DateTime.now().subtract(Duration(
          hours: DateTime.now().hour,
          minutes: DateTime.now().minute,
          seconds: DateTime.now().second));
    }
  }

  _fetchTodaysOrders() async {
    Map<String, OrderType> allOrderTypesMap = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allOrderTypes').get();
    List<OrderType> listOfOrderTypes = querySnapshot.docs
        .map((doc) => OrderType(
            name: doc['name'],
            price: double.parse(doc['price'].toString()),
            amharicName: doc['amharicName']))
        .toList();
    for (int i = 0; i < listOfOrderTypes.length; i++) {
      allOrderTypesMap.addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
    }

    try {
      database
          .collection('customers')
          .doc(customer.id)
          .collection('orders')
          .where('dateAndTime', isGreaterThan: dateTimeForToday)
          .orderBy('dateAndTime', descending: true)
          .snapshots()
          .listen((data) {
        List<CustomOrder.Order> orders = data.docs
            .map((doc) => CustomOrder.Order.fromSnapshot(doc, allOrderTypesMap))
            .toList();
        todaysOrdersController.sink.add(orders);
      });
    } on FirebaseException {
      if (kDebugMode) {
        print('Firebase Exception');
      }
    } catch (e) {
      if (kDebugMode) {
        print('error $e');
      }
    }
  }

  _fetchWeeklyOrders() async {
    Map<String, OrderType> allOrderTypesMap = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allOrderTypes').get();
    List<OrderType> listOfOrderTypes = querySnapshot.docs
        .map((doc) => OrderType(
            name: doc['name'],
            price: double.parse(doc['price'].toString()),
            amharicName: doc['amharicName']))
        .toList();
    for (int i = 0; i < listOfOrderTypes.length; i++) {
      allOrderTypesMap.addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
    }

    try {
      database
          .collection('customers')
          .doc(customer.id)
          .collection('orders')
          .where('dateAndTime', isGreaterThan: getWeeklyDate())
          .orderBy('dateAndTime', descending: true)
          .snapshots()
          .listen((data) {
        List<CustomOrder.Order> orders = data.docs
            .map((doc) => CustomOrder.Order.fromSnapshot(doc, allOrderTypesMap))
            .toList();
        weeklyOrdersController.sink.add(orders);
      });
    } on FirebaseException {
      if (kDebugMode) {
        print('Firebase Exception');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error $e');
      }
    }
  }

  _fetchAllOrders() async {
    Map<String, OrderType> allOrderTypesMap = {};
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('allOrderTypes').get();
    List<OrderType> listOfOrderTypes = querySnapshot.docs
        .map((doc) => OrderType(
            name: doc['name'],
            price: double.parse(doc['price'].toString()),
            amharicName: doc['amharicName']))
        .toList();
    for (int i = 0; i < listOfOrderTypes.length; i++) {
      allOrderTypesMap.addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
    }

    try {
      database
          .collection('customers')
          .doc(customer.id)
          .collection('orders')
          .orderBy('dateAndTime', descending: true)
          .snapshots()
          .listen((data) {
        List<CustomOrder.Order> orders = data.docs
            .map((doc) => CustomOrder.Order.fromSnapshot(doc, allOrderTypesMap))
            .toList();
        allOrdersController.sink.add(orders);
      });
    } on FirebaseException {
      if (kDebugMode) {
        print('Firebase Exception');
      }
    } catch (e) {
      if (kDebugMode) {
        print('error $e');
      }
    }
  }
}
