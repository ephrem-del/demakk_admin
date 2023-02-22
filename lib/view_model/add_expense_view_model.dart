import 'package:cloud_firestore/cloud_firestore.dart';

import '../objects/date_and_time.dart';
import '../objects/expense.dart';

class AddExpenseViewModel {
  Future<bool> addExpense(
      String reason, double price, ExpenseType expenseType) async {
    bool isSaved = false;
    final Expense expense = Expense(
        reason: reason,
        price: price,
        expenseType: expenseType,
        dateAndTime: DateAndTime(dateTime: DateTime.now()));
    try {
      await FirebaseFirestore.instance
          .collection('expenses')
          .add(expense.toMap());
      isSaved = true;
    } on FirebaseException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return isSaved;
  }
}
