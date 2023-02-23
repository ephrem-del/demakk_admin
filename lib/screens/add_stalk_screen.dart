import 'package:demakk_admin/objects/stalk_category.dart';
import 'package:demakk_admin/resources/stock_resource.dart';
import 'package:flutter/material.dart';

import '../business_logic/stalk_processing.dart';
import '../utilities/constants.dart';

class AddStalkScreen extends StatefulWidget {
  const AddStalkScreen({Key? key}) : super(key: key);

  @override
  State<AddStalkScreen> createState() => _AddStalkScreenState();
}

class _AddStalkScreenState extends State<AddStalkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: amharic ? const Text('ዕቃ መጨመሪያ') : const Text('Add Stalk'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: SizedBox(
            height: 500,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Column(children: getRows()),
                    Row(
                      children: [
                        amharic
                            ? const Text(
                                'ብዛት',
                                style: subTitleTextStyle,
                              )
                            : const Text(
                                'Amount',
                                style: subTitleTextStyle,
                              ),
                        const Spacer(),
                        DropdownButton(
                            items: _amountList,
                            value: _selectedAmount,
                            onChanged: (selected) {
                              setState(() {
                                _selectedAmount = selected;
                              });
                            })
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: amharic
                                    ? const Text('ዕቃ በመጨመር ላይ')
                                    : const Text('Adding Stalk'),
                                content: amharic
                                    ? const Text('ዕቃ መጨመር ትፈልጋለህ/ሽ?')
                                    : const Text(
                                        'Are you sure you want to add a Stalk?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xFFC5C2C2),
                                      ),
                                    ),
                                    child: amharic
                                        ? const Text('ሰርዝ')
                                        : const Text('Cancel'),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, '/home_screen');
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                primaryColor)),
                                    child: amharic
                                        ? const Text('አዎ')
                                        : const Text('Yes'),
                                  ),
                                  const SizedBox(
                                    width: 11,
                                  ),
                                ],
                              );
                            });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                      ),
                      child: amharic
                          ? const Text('ዕቃ ጨምር')
                          : const Text('Add Stalk'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

int _selectedAmount = 1;

// Widget addStalkRow(StalkCategory stalkCategory, items, value) {
//
//   String _value = value;
//   // final StalkCategory stalkCategory;
//   return Row(
//     children: [
//       Text(
//         stalkCategory.categoryTitle,
//         style: subTitleTextStyle,
//       ),
//       Spacer(),
//       DropdownButton(
//           items: items,
//           value: _value,
//           onChanged: (selected) {
//
//             _value = selected!;
//           })
//     ],
//   );
// }

class AddStalkRow extends StatefulWidget {
  final StalkCategory stalkCategory;
  final List<DropdownMenuItem> items;
  String? value;
  AddStalkRow(
      {Key? key,
      required this.stalkCategory,
      required this.items,
      required this.value})
      : super(key: key);

  @override
  State<AddStalkRow> createState() => _AddStalkRowState();
}

class _AddStalkRowState extends State<AddStalkRow> {
  // String _value = widget.value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: amharic
              ? Text(
                  widget.stalkCategory.amharicCategoryTitle,
                  style: subTitleTextStyle,
                )
              : Text(
                  widget.stalkCategory.categoryTitle,
                  style: subTitleTextStyle,
                ),
        ),
        // SizedBox(
        //   width: 20,
        // ),
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 30,
            child: DropdownButtonFormField(
                hint: amharic ? const Text('ምረጥ/ጪ') : const Text('Choose'),
                items: widget.items,
                value: widget.value,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    fillColor: primaryColor,
                    iconColor: Colors.yellowAccent,
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                validator: (value) {
                  return null;
                },
                onChanged: (selected) {
                  setState(() {
                    widget.value = selected!;
                  });
                }),
          ),
        )
      ],
    );
  }
}

// class StalkRow extends StatefulWidget {
//   final StalkCategory stalkCategory;
//   const StalkRow({Key? key, required this.stalkCategory}) : super(key: key);
//
//   @override
//   State<StalkRow> createState() => _StalkRowState();
// }
//
// class _StalkRowState extends State<StalkRow> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           widget.stalkCategory.categoryTitle,
//           style: subTitleTextStyle,
//         ),
//         Spacer(),
//         DropdownButton(
//             items: _items,
//             value: value,
//             onChanged: (selected) {
//               value = selected;
//             })
//       ],
//     );
//   }
// }

//String value = 'White Mug';
//List<DropdownMenuItem> items = [];
// List<DropdownMenuItem> _items = getStalks(stalkCategories[0])
//     .map((stalk) => DropdownMenuItem(
//           child: Text(stalk.stalkType.typeName),
//           value: stalk.stalkType.typeName,
//         ))
//     .toList();
bool otherSelected = false;
List<Widget> getRows() {
  List<Widget> listOfRows = [];
  for (int i = 0; i < stalkCategories.length; i++) {
    String? value;

    //use the value below to set initial values;
    //
    // String value = stalks
    //     .where((stalk) => stalk.stalkType.stalkCategory == stalkCategories[i])
    //     .first
    //     .stalkType
    //     .typeName;

    List<DropdownMenuItem> items = otherSelected
        ? []
        : getStalks(stalkCategories[i])
            .map((stalk) => DropdownMenuItem(
                  value: stalk.stockType.typeName,
                  child: amharic
                      ? Text(stalk.stockType.amharicTypeName)
                      : Text(stalk.stockType.typeName),
                ))
            .toList();
    listOfRows.add(
      AddStalkRow(
        stalkCategory: stalkCategories[i],
        items: items,
        value: value,
      ),
    );
    //_listOfRows.add(AddStalkRow(stalkCategories[i], items, value));
  }
  return listOfRows;
}

List<DropdownMenuItem> _amountList = amount
    .map(
      (amount) => DropdownMenuItem(
        value: amount,
        child: Text(
          amount.toString(),
        ),
      ),
    )
    .toList();

String selectedVariable = '';

void selectType() {}
