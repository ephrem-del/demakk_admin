import 'package:demakk_admin/objects/stalk_category.dart';
//import 'package:demakk_admin/objects/stalk_type.dart';
import 'package:demakk_admin/resources/stock_resource.dart';
//import 'package:demakk_admin/screens/history_screen.dart';
import 'package:flutter/material.dart';

import '../business_logic/stalk_processing.dart';
import '../objects/stalkTypeSimplified.dart';
import '../utilities/constants.dart';
import '../view_model/add_stalk_view_model.dart';

import '../main.dart';

class AddStalkScreen extends StatefulWidget {
  const AddStalkScreen({Key? key}) : super(key: key);

  @override
  State<AddStalkScreen> createState() => _AddStalkScreenState();
}

class _AddStalkScreenState extends State<AddStalkScreen> {
  final AddStalkViewModel addStalkViewModel = AddStalkViewModel();

  String? selectedStalkCategory;
  String? selectedStalkType;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<bool> addNewStock() async {
    bool isAdded = await addStalkViewModel.addStalk(
      categoryTitle: selectedStalkCategory!,
      stalkType: selectedStalkType!,
      amountAdded: _selectedAmount,
    );
    return isAdded;
  }

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
            height: MediaQuery.of(context).size.height * 0.6,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(35.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Column(children: getRows()),
                      Text(
                        amharic ? 'የዕቃ አይነት' : 'Stalk Type',
                        style: subTitleTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<List<StalkCategory>>(
                          stream: addStalkViewModel
                              .stalkCategoriesController.stream,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              const Text('Error on snapshot');
                            }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Text('Loading...');
                              default:
                                if (!snapshot.hasData) {
                                  return const Text('No Data');
                                }
                            }
                            List<StalkCategory> stalkCategories =
                                snapshot.data!;
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: DropdownButtonFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return amharic
                                          ? 'የዕቃ አይነት መምረጥ አስፈላጊ ነው'
                                          : 'Select Stalk Category';
                                    }
                                    return null;
                                  },
                                  // alignment: AlignmentDirectional.centerEnd,
                                  items: stalkCategories
                                      .map((stalkCategory) => DropdownMenuItem(
                                            child: Text(
                                              amharic
                                                  ? stalkCategory
                                                      .amharicCategoryTitle
                                                  : stalkCategory.categoryTitle,
                                              textAlign: TextAlign.center,
                                            ),
                                            value: stalkCategory.categoryTitle,
                                          ))
                                      .toList(),
                                  value: selectedStalkCategory,
                                  onChanged: (selected) {
                                    setState(() {
                                      selectedStalkCategory = selected;
                                      selectedStalkType = null;
                                    });
                                  }),
                            );
                          }),
                      SizedBox(
                        height: 20,
                      ),

                      selectedStalkCategory == null
                          ? SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  amharic ? 'የዕቃ መለያ' : 'Stalk Type',
                                  style: subTitleTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                StreamBuilder(
                                    stream: addStalkViewModel
                                        .stalkTypesController.stream,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasError) {
                                        return const Text('error');
                                      }
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return const Text('Loading...');
                                        default:
                                          if (!snapshot.hasData) {
                                            return const Text('No data');
                                          }
                                      }

                                      List<StalkTypeSimplified> stalkTypes =
                                          snapshot.data!;
                                      for (int i = 0;
                                          i < stalkTypes.length;
                                          i++) {
                                        if (stalkTypes[i].categoryTitle ==
                                            selectedStalkCategory) {
                                          return SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: DropdownButtonFormField<
                                                    String>(
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return amharic
                                                        ? 'የዕቃ አይነት መምረጥ አስፈላጊ ነው'
                                                        : 'Stalk Type is required';
                                                  }
                                                  return null;
                                                },
                                                // alignment: AlignmentDirectional
                                                //     .centerEnd,
                                                value: selectedStalkType,
                                                items: stalkTypes
                                                    .where((stalkType) =>
                                                        stalkType
                                                            .categoryTitle ==
                                                        selectedStalkCategory)
                                                    .map((stalkType) =>
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              stalkType.name),
                                                          value: stalkType.name,
                                                        ))
                                                    .toList(),
                                                onChanged: (selected) {
                                                  setState(() {
                                                    selectedStalkType =
                                                        selected;
                                                  });
                                                }),
                                          );
                                        }
                                      }
                                      return const Text(
                                          'Something is not working right');
                                    }),
                              ],
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Row(
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
                      ),
                      const Spacer(),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
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
                                            onPressed: () async {
                                              bool isAdded =
                                                  await addNewStock();
                                              if (isAdded) {
                                                //print(selectedStalkType);
                                                //print(selectedStalkCategory);
                                                Navigator.pop(context);
                                                Navigator.pushNamed(
                                                    context, '/home_screen');
                                              }
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
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                            child: amharic
                                ? const Text('ዕቃ ጨምር')
                                : const Text('Add Stalk'),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                  value: stalk.stalkType.typeName,
                  child: amharic
                      ? Text(stalk.stalkType.amharicTypeName)
                      : Text(stalk.stalkType.typeName),
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
