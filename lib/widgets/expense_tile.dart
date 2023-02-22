import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/expense_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../objects/expense.dart';

class ExpenseTile extends StatelessWidget {
  final ExpenseScreenViewModel _expenseScreenViewModel =
      ExpenseScreenViewModel();
  final Expense expense;
  ExpenseTile({Key? key, required this.expense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                expense.reason,
                style: subTitleTextStyle,
              ),
              const Divider(
                color: primaryColor,
                thickness: 3.0,
              ),
              amharic
                  ? Text(
                      expense.expenseType.amharicTypeName,
                      style: subTitleTextStyle,
                    )
                  : Text(
                      expense.expenseType.typeName,
                      style: subTitleTextStyle,
                    ),
              const Divider(
                color: primaryColor,
              ),
              Text(
                expense.price.toString() + ' Birr',
                style: subTitleTextStyle,
              ),
              expense.paidOrNot
                  ? amharic
                      ? Text('ክፍያ የተጠናቀቀ')
                      : Text('Payment Made')
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: amharic ? Text('ክፍያ') : Text('Payment'),
                                content: amharic
                                    ? Text('የዚን ወጪ ክፍያ ጨርሰሀል/ሻል?')
                                    : Text(
                                        'Have you completed payment of this expense?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child:
                                        amharic ? Text('ሰርዝ') : Text('Cancel'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xFFC5C2C2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _expenseScreenViewModel
                                          .markAsPaid(expense);
                                    },
                                    child: amharic ? Text('አዎ') : Text('Yes'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11,
                                  ),
                                ],
                              );
                            });
                      },
                      child: amharic ? Text('ተከፍሏል') : Text('Paid'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
