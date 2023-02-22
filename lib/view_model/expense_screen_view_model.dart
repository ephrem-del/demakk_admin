import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../objects/expense.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseScreenViewModel {
  final BehaviorSubject<List<Expense>> expenseBehaviorSubjectController =
      BehaviorSubject<List<Expense>>();
  // final StreamController<List<Expense>> expenseStreamController =
  //     StreamController<List<Expense>>();
  ExpenseScreenViewModel() {
    _fetchExpenses();
  }

  Future<void> _fetchExpenses() async {
    FirebaseFirestore.instance
        .collection('expenses')
        .orderBy('paidOrNot', descending: false)
        .orderBy('dateAndTime', descending: true)
        .snapshots()
        .listen((data) {
      List<Expense> expenses =
          data.docs.map((doc) => Expense.fromSnapshot(doc)).toList();
      //expenseStreamController.sink.add(expenses);
      expenseBehaviorSubjectController.sink.add(expenses);
    });
  }

  Future<void> markAsPaid(Expense expense) async {
    await FirebaseFirestore.instance.runTransaction((transaction) async {
      final secureSnapshot = await transaction.get(
          FirebaseFirestore.instance.collection('expenses').doc(expense.id));
      //final bool paidOrNot = secureSnapshot.get('paidOrNot') as bool;
      transaction.update(secureSnapshot.reference, {'paidOrNot': true});
    });
  }

  void dispose() {
    //expenseStreamController.close();
    expenseBehaviorSubjectController.close();
  }
}
