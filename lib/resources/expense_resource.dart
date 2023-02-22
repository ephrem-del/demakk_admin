import 'package:demakk_admin/objects/date_and_time.dart';

import '../objects/expense.dart';

// List<Expense> expenses = <Expense>[
//   Expense(
//       reason: 'piasa to atobistera',
//       price: 7,
//       paidOrNot: false,
//       expenseType: expenseTypesMap['Transport']!, dateAndTime: DateAndTime(dateTime: Da)),
//   Expense(
//       reason: 'Glossy',
//       price: 420,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Purchase']!),
//   Expense(
//       reason: 'scissor',
//       price: 190,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Purchase']!),
//   Expense(
//       reason: 'rent',
//       price: 5500,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Others']!),
//   Expense(
//       reason: 'atobistera to atenatera',
//       price: 7,
//       paidOrNot: false,
//       expenseType: expenseTypesMap['Transport']!),
//   Expense(
//       reason: 'Art paper',
//       price: 500,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Purchase']!),
//   Expense(
//       reason: 'banner',
//       price: 1190,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Purchase']!),
//   Expense(
//       reason: 'bonus',
//       price: 5500,
//       paidOrNot: true,
//       expenseType: expenseTypesMap['Others']!),
// ];
//
Map<String, ExpenseType> expenseTypesMap = <String, ExpenseType>{
  'Transport': ExpenseType(typeName: 'Transport', amharicTypeName: 'የታክሲ'),
  'Purchase': ExpenseType(typeName: 'Purchase', amharicTypeName: 'ግዢ'),
  'Others': ExpenseType(typeName: 'Others', amharicTypeName: 'ሌሎች'),
};

List<ExpenseType> expenseTypes = [
  ExpenseType(typeName: 'Transport', amharicTypeName: 'የታክሲ'),
  ExpenseType(typeName: 'Purchase', amharicTypeName: 'ግዢ'),
  ExpenseType(typeName: 'Others', amharicTypeName: 'ሌሎች'),
];
