import 'package:demakk_admin/objects/order_type.dart';
import 'package:demakk_admin/objects/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/resources/order_resource.dart';

import '../resources/priorites.dart';
import 'customer.dart';
import 'date_and_time.dart';

class Order {
  String id;
  OrderType type;
  int amount;
  String comment;
  Priority priority;
  String customerId;
  bool completed;
  DateAndTime dateAndTime;
  double paid;
  String customerName;
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
      required this.customerName});

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
      'customerName': customerName
    };
  }

  factory Order.fromSnapshot(QueryDocumentSnapshot doc) {
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
    );
  }
}
