import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/widgets/expense_tile.dart';
import 'package:flutter/material.dart';

// import '../business_logic/expense_processing.dart';
import '../view_model/expense_screen_view_model.dart';
import 'add_expense_screen.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({Key? key}) : super(key: key);

  final ExpenseScreenViewModel expenseScreenViewModel =
      ExpenseScreenViewModel();

  @override
  Widget build(BuildContext context) {
    //final expenseStream = expenseScreenViewModel.expenseStreamController.stream;

    final expense2Stream =
        expenseScreenViewModel.expenseBehaviorSubjectController.stream;

    return Scaffold(
      body: StreamBuilder(
        stream: expense2Stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('error');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading');
            default:
              if (!snapshot.hasData) {
                return const Text('No data');
              }
          }
          return ListView(
            children: snapshot.data!
                .map((expense) => ExpenseTile(expense: expense))
                .toList(),
          );
        },
        // child: ListView(
        //   children: getExpenseTiles(),
        // ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddExpenseScreen();
          }));
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
