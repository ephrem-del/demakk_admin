import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/date_and_time.dart';

import '../resources/expense_resource.dart';

class Expense {
  final String reason;
  bool paidOrNot;
  final double price;
  final ExpenseType expenseType;
  final DateAndTime dateAndTime;
  String? id;
  String employee;
  Expense({
    required this.reason,
    required this.price,
    this.paidOrNot = false,
    required this.expenseType,
    required this.dateAndTime,
    this.id = '',
    required this.employee,
  });

  Map<String, dynamic> toMap() {
    return {
      'reason': reason,
      'paidOrNot': paidOrNot,
      'price': price,
      'expenseType': expenseType.typeName,
      'dateAndTime': dateAndTime.dateTime,
      'employee': employee,
    };
  }

  factory Expense.fromSnapshot(QueryDocumentSnapshot doc) {
    return Expense(
        reason: doc['reason'],
        price: doc['price'],
        paidOrNot: doc['paidOrNot'],
        id: doc.id,
        employee: doc['employee'],
        expenseType: ExpenseType(
            typeName: doc['expenseType'],
            amharicTypeName:
                expenseTypesMap[doc['expenseType']]!.amharicTypeName),
        dateAndTime: DateAndTime(dateTime: doc['dateAndTime'].toDate()));
  }
}

class ExpenseType {
  final String typeName;
  final String amharicTypeName;
  ExpenseType({required this.typeName, required this.amharicTypeName});
}
