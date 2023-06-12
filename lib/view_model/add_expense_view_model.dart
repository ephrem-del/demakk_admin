import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/provider/employee_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../objects/date_and_time.dart';
import '../objects/employee.dart';
import '../objects/expense.dart';
import 'package:provider/provider.dart';

class AddExpenseViewModel {

  Future<bool> addExpense(
      String reason, double price, ExpenseType expenseType, BuildContext context) async {
    Employee employee = Provider.of<EmployeeProvider>(context, listen: false).currentUser!.employee;
    bool isSaved = false;
    final Expense expense = Expense(
        reason: reason,
        price: price,
        employee: employee.name,
        expenseType: expenseType,
        dateAndTime: DateAndTime(dateTime: DateTime.now()));
    try {
      await FirebaseFirestore.instance
          .collection('expenses')
          .add(expense.toMap());
      isSaved = true;
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
}
