import 'package:demakk_admin/objects/order_type.dart';
import 'package:demakk_admin/objects/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:demakk_admin/resources/order_resource.dart';

import '../resources/priorites.dart';
// import 'customer.dart';
import 'date_and_time.dart';

class Order {
  final String id;
  final OrderType type;
  final int amount;
  final String comment;
  final Priority priority;
  final String customerId;
  final bool completed;
  final DateAndTime dateAndTime;
  final double paid;
  final String customerName;
  double price;
  // late Map<String, OrderType> allOrderTypesMap;
  Order(
      {this.id = '',
      required this.type,
      required this.amount,
      required this.comment,
      required this.priority,
      required this.customerId,
      required this.completed,
      required this.dateAndTime,
      required this.paid,
      required this.customerName,
      this.price = 0.0}) {
    price = type.price;
    // _getAllOrderTypesMap();
  }

  // void _getAllOrderTypesMap() async {
  //   QuerySnapshot querySnapshot =
  //   await FirebaseFirestore.instance.collection('allOrderTypes').get();
  //   List<OrderType> listOfOrderTypes = querySnapshot.docs
  //       .map((doc) => OrderType(
  //       name: doc['name'],
  //       price: double.parse(doc['price'].toString()),
  //       amharicName: doc['amharicName']))
  //       .toList();
  //   for (int i = 0; i < listOfOrderTypes.length; i++) {
  //     allOrderTypesMap
  //         .addAll({listOfOrderTypes[i].name: listOfOrderTypes[i]});
  //   }
  //   // print(allOrderTypesMap);
  // }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'amount': amount,
      'comment': comment,
      'priority': priority.priorityType.name,
      'customerId': customerId,
      'completed': completed,
      'dateAndTime': dateAndTime.dateTime,
      'paid': paid,
      'customerName': customerName,
      'price': type.price,
    };
  }

  factory Order.fromSnapshot(
      QueryDocumentSnapshot doc, Map<String, OrderType> allOrderTypesMap) {
    //OrderResource orderResource = OrderResource();
    // print('doc: ${doc['type']}');
    // print('doc: ${orderResource.allOrderTypesMap}');
    // print('orderType: ${orderResource.allOrderTypesMap[doc['type']]}');

    return Order(
      id: doc.id,
      type: allOrderTypesMap[doc['type']]!,
      amount: doc['amount'],
      comment: doc['comment'],
      priority: priorities[doc['priority']]!,
      customerId: doc['customerId'],
      completed: doc['completed'],
      dateAndTime: DateAndTime(
        dateTime: doc['dateAndTime'].toDate(),
      ),
      paid: doc['paid'],
      customerName: doc['customerName'],
      price: doc['price'],
    );
  }
}
