import 'package:demakk_admin/objects/expense.dart';
import 'package:flutter/material.dart';

import '../resources/expense_resource.dart';
import '../utilities/constants.dart';
import '../view_model/add_expense_view_model.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final AddExpenseViewModel _addExpenseViewModel = AddExpenseViewModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _authenticate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: amharic
                  ? const Text('ወጪ በመጨመር ላይ')
                  : const Text('Adding Expense'),
              content: amharic
                  ? const Text('ወጪ መጨመር ትፈልጋለህ/ሽ?')
                  : const Text('Are you sure you want to add a new Expense?'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xFFC5C2C2),
                    ),
                  ),
                  child: amharic ? const Text('ሰርዝ') : const Text('Cancel'),
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    String reason = _reasonController.text;
                    double price = double.parse(_priceController.text);
                    ExpenseType expenseType = expenseTypesMap[selectedType]!;
                    _addExpenseViewModel.addExpense(reason, price, expenseType);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home_screen');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: amharic ? const Text('አዎ') : const Text('Yes'),
                ),
                const SizedBox(
                  width: 11,
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: amharic ? const Text('ወጪ መጨመሪያ') : const Text('Add Expense'),
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'የወጪ አይነት',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Expense Type',
                            style: subTitleTextStyle,
                          ),
                    const Spacer(),
                    Expanded(
                      child: DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return amharic
                                  ? 'የወጪ አይነት ማስገባት አስፈላጊ ነው'
                                  : 'Expense type is required';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          items: _items,
                          value: selectedType,
                          hint: amharic
                              ? const Text('ምረጥ/ጪ')
                              : const Text('Choose'),
                          onChanged: (selected) {
                            setState(() {
                              selectedType = selected;
                            });
                          }),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                amharic
                    ? const Text(
                        'ዋጋ',
                        style: subTitleTextStyle,
                      )
                    : const Text(
                        'Price',
                        style: subTitleTextStyle,
                      ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: _priceController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'ዋጋ ማስገባት አስፈላጊ ነው'
                            : 'Price is required';
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: userInputDecoration(amharic ? 'ዋጋ' : 'Price',
                        const Icon(Icons.monetization_on_outlined)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                amharic
                    ? const Text(
                        'ምክንያት',
                        style: subTitleTextStyle,
                      )
                    : const Text(
                        'Reason',
                        style: subTitleTextStyle,
                      ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _reasonController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return amharic
                          ? 'ምክንያት ማስገባት አስፈላጊ ነው'
                          : 'Reason is required';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 4,
                  decoration: InputDecoration(
                    prefixIconColor: primaryColor,
                    hintText: amharic ? 'ምክንያት' : 'Reason',
                    fillColor: primaryColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  onPressed: () {
                    _authenticate(context);
                  },
                  child: amharic
                      ? const Text('ወጪ ጨምር')
                      : const Text('Add Expense'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? selectedType;
List<DropdownMenuItem> _items = expenseTypes
    .map(
      (expenseType) => DropdownMenuItem(
        value: expenseType.typeName,
        child: amharic
            ? Text(expenseType.amharicTypeName)
            : Text(expenseType.typeName),
      ),
    )
    .toList();
