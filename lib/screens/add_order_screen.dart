// import 'package:demakk_admin/resources/customer_list.dart';
import 'package:demakk_admin/resources/order_resource.dart';
import 'package:demakk_admin/resources/priorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:im_stepper/main.dart';
//import 'package:im_stepper/stepper.dart';

import '../objects/customer.dart';
import '../objects/order_type.dart';
import '../objects/priority.dart';
import '../resources/order_resource.dart';
import '../utilities/constants.dart';
import '../view_model/add_order_view_model.dart';

import '../main.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  String? _selectedCustomer;
  String? _selectedOrderType;
  late String _selectedMug;
  late String _selectedPlot;
  String _selectedTshirt = tshirtTypes[0].name;
  String _selectedTshirtSize = tshirtSizes[1];
  String _selectedColor = colorSelection[0].name;
  late String _selectedStamp; // = flashStampTypes[0].name;
  String _selectedPriority = priorities2[2].priorityType.name;
  int _selectedAmount = 1;

  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool plotOrNot = false;
  bool mugOrNot = false;
  bool tshirtOrNot = false;
  bool flashStampOrNot = false;
  bool whiteMugOrNot = false;
  bool magicMugOrNot = false;

  bool flatBagXxlWhiteOrNot = false;
  bool flatBagXlWhiteOrNot = false;
  bool flatBagLWhiteOrNot = false;
  bool flatBagMWhiteOrNot = false;

  bool flatBagXxlBlackOrNot = false;
  bool flatBagXlBlackOrNot = false;
  bool flatBagLBlackOrNot = false;
  bool flatBagMBlackOrNot = false;

  bool polyesterXxlWhiteOrNot = false;
  bool polyesterXlWhiteOrNot = false;
  bool polyesterLWhiteOrNot = false;
  bool polyesterMWhiteOrNot = false;

  bool polyesterXxlBlackOrNot = false;
  bool polyesterXlBlackOrNot = false;
  bool polyesterLBlackOrNot = false;
  bool polyesterMBlackOrNot = false;

  bool polyCottonXxlWhiteOrNot = false;
  bool polyCottonXlWhiteOrNot = false;
  bool polyCottonLWhiteOrNot = false;
  bool polyCottonMWhiteOrNot = false;

  bool polyCottonXxlBlackOrNot = false;
  bool polyCottonXlBlackOrNot = false;
  bool polyCottonLBlackOrNot = false;
  bool polyCottonMBlackOrNot = false;

  bool ovalStampOrNot = false;
  bool headStampOrNOt = false;
  bool fortyByTwentyStampOrNot = false;

  bool goldenOrNot = false;
  bool goldenShineOrNot = false;
  bool whiteOrNot = false;
  bool blackOrNot = false;
  bool glassStickerOrNot = false;

  int whiteMugAmount = 0;
  int magicMugAmount = 0;

  int flatBagXxlWhiteAmount = 0;
  int flatBagXlWhiteAmount = 0;
  int flatBagLWhiteAmount = 0;
  int flatBagMWhiteAmount = 0;

  int flatBagXxlBlackAmount = 0;
  int flatBagXlBlackAmount = 0;
  int flatBagLBlackAmount = 0;
  int flatBagMBlackAmount = 0;

  int polyesterXxlWhiteAmount = 0;
  int polyesterXlWhiteAmount = 0;
  int polyesterLWhiteAmount = 0;
  int polyesterMWhiteAmount = 0;

  int polyesterXxlBlackAmount = 0;
  int polyesterXlBlackAmount = 0;
  int polyesterLBlackAmount = 0;
  int polyesterMBlackAmount = 0;

  int polyCottonXxlWhiteAmount = 0;
  int polyCottonXlWhiteAmount = 0;
  int polyCottonLWhiteAmount = 0;
  int polyCottonMWhiteAmount = 0;

  int polyCottonXxlBlackAmount = 0;
  int polyCottonXlBlackAmount = 0;
  int polyCottonLBlackAmount = 0;
  int polyCottonMBlackAmount = 0;

  int ovalStampAmount = 0;
  int headStampAmount = 0;
  int fortyByTwentyStampAmount = 0;

  int goldenAmount = 0;
  int goldenShineAmount = 0;
  int whiteAmount = 0;
  int blackAmount = 0;
  int glassStickerAmount = 0;

  late OrderType type;
  late OrderResource orderResource;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String customerName;

  // _AddOrderScreenState(){
  //   orderResource = OrderResource();
  // }

  @override
  void initState() {
    orderResource = OrderResource();
    _selectedMug = mugTypes[0]
        .name; //orderResource.mugTypesList[0].name; //mugTypes[0].name;
    _selectedPlot = plotTypes[0]
        .name; //orderResource.plotTypesList[0].name; //plotTypes[0].name;
    _selectedStamp = flashStampTypes[0].name;
    //orderResource.flashStampTypesList[0].name; //flashStampTypes[0].name;
    super.initState();
  }

  final AddOrderViewModel _addOrderViewModel = AddOrderViewModel();

  void authenticate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: amharic
                  ? const Text('ትዕዛዝ በመጨመር ላይ')
                  : const Text('Adding Order'),
              content: amharic
                  ? const Text('አዲስ ትዕዛዝ መጨመር ትፈልጋለህ/ሽ?')
                  : const Text('Are you sure you want to add an Order?'),
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
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    double paid = double.parse(_paymentController.text);
                    String comment = _commentController.text;
                    int amount = _selectedAmount;
                    String customerId = _selectedCustomer!;
                    Priority priority = priorities[_selectedPriority]!;
                    //String categoryType = _selectedOrderType!;
                    String categoryTypeForFunction = '';
                    if (plotOrNot) {
                      //print('selectedPlot: $_selectedPlot');
                      //print(OrderResource().plotTypesMap[_selectedPlot]!);
                      //print(orderResource.plotTypesMap);
                      type = orderResource.plotTypesMap[_selectedPlot]!;
                    } else if (mugOrNot) {
                      type = OrderResource().allOrderTypesMap[//mugTypesMap[
                          _selectedMug]!; //mugTypesMap[_selectedMug]!;
                    } else if (tshirtOrNot) {
                      //check if poly-cotton or not here
                      // check whites here
                      if (polyCottonMWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton White M']!;
                      } else if (polyCottonLWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton White L']!;
                      } else if (polyCottonXlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton White XL']!;
                      } else if (polyCottonXxlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton White XXL']!;
                      }
                      //check blacks here
                      else if (polyCottonMBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton Black M']!;
                      } else if (polyCottonLBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton Black L']!;
                      } else if (polyCottonXlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton Black XL']!;
                      } else if (polyCottonXxlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Poly-Cotton Black XXL']!;
                      }

                      //check if flat-bag or not
                      //check whites here
                      else if (flatBagMWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag White M']!;
                      } else if (flatBagLWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag White L']!;
                      } else if (flatBagXlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag White XL']!;
                      } else if (flatBagXxlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag White XXL']!;
                      }
                      //check blacks here
                      else if (flatBagMBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag Black M']!;
                      } else if (flatBagLBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag Black L']!;
                      } else if (flatBagXlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag Black XL']!;
                      } else if (flatBagXxlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Flat-Bag Black XXL']!;
                      }

                      //check if polyester or not
                      //check whites here
                      else if (polyesterMWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester White M']!;
                      } else if (polyesterLWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester White L']!;
                      } else if (polyesterXlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester White XL']!;
                      } else if (polyesterXxlWhiteOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester White XXL']!;
                      }
                      //check blacks here
                      else if (polyesterMBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester Black M']!;
                      } else if (polyesterLBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester Black L']!;
                      } else if (polyesterXlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester Black XL']!;
                      } else if (polyesterXxlBlackOrNot) {
                        type = OrderResource()
                            .allOrderTypesMap['Polyester Black XXL']!;
                      }

                      //type = tshirtTypesMap[_selectedTshirt]!;
                    } else if (flashStampOrNot) {
                      print('selected stamp: ${_selectedStamp}');
                      print(
                          'ordertype: ${OrderResource().allOrderTypesMap[_selectedStamp]?.name}');
                      type = OrderResource().flashStampTypesMap[
                          _selectedStamp]!; //flashStampTypesMap[_selectedStamp]!;
                    } else {
                      type = OrderResource().allOrderTypesMap[
                          'Other']!; //orderTypesMap['Other']!;
                    }

                    if (mugOrNot) {
                      categoryTypeForFunction = 'Mug';
                    } else if (plotOrNot) {
                      categoryTypeForFunction = 'Plot';
                    } else if (tshirtOrNot) {
                      if (polyCottonLBlackOrNot ||
                          polyCottonLWhiteOrNot ||
                          polyCottonMBlackOrNot ||
                          polyCottonMWhiteOrNot ||
                          polyCottonXlBlackOrNot ||
                          polyCottonXlWhiteOrNot ||
                          polyCottonXxlBlackOrNot ||
                          polyCottonXxlWhiteOrNot) {
                        categoryTypeForFunction = 'Poly-Cotton Shirt';
                      } else if (polyesterMWhiteOrNot ||
                          polyesterMBlackOrNot ||
                          polyesterLWhiteOrNot ||
                          polyesterLBlackOrNot ||
                          polyesterXlWhiteOrNot ||
                          polyesterXlBlackOrNot ||
                          polyesterXxlWhiteOrNot ||
                          polyesterXxlBlackOrNot) {
                        categoryTypeForFunction = 'Polyester Shirt';
                      } else {
                        categoryTypeForFunction = 'Flat-bag Shirt';
                      }
                    } else if (flashStampOrNot) {
                      categoryTypeForFunction = 'Flash Stamp';
                    }

                    print(type);
                    print(amount);
                    print(comment);
                    print(priority.priorityType.name);
                    print(customerId);
                    print(paid);
                    print(customerName);
                    print(categoryTypeForFunction);
                    //bool added = true;
                    bool added = await _addOrderViewModel.addOrder(
                        type,
                        amount,
                        comment,
                        priority,
                        customerId,
                        paid,
                        customerName,
                        categoryTypeForFunction);
                    if (added) {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/home_screen');
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  child: amharic ? const Text('አዎ') : const Text('Yes'),
                ),
                const SizedBox(
                  width: 11,
                ),
              ],
            );
          });
    }
  }

  String getCustomerName(List<Customer> customers) {
    String customerName = '';
    for (int i = 0; i < customers.length; i++) {
      if (_selectedCustomer == customers[i].id) {
        customerName = customers[i].name;
      }
    }
    return customerName;
  }

  List<int> getAvailableAmount() {
    List<int> _amount = <int>[];
    if (whiteMugOrNot) {
      _amount = List<int>.generate(whiteMugAmount, (index) => index + 1);
    } else if (magicMugOrNot) {
      _amount = List<int>.generate(magicMugAmount, (index) => index + 1);
    } else if (ovalStampOrNot) {
      _amount = List<int>.generate(ovalStampAmount, (index) => index + 1);
    } else if (fortyByTwentyStampOrNot) {
      _amount =
          List<int>.generate(fortyByTwentyStampAmount, (index) => index + 1);
    } else if (headStampOrNOt) {
      _amount = List<int>.generate(headStampAmount, (index) => index + 1);
    } else if (polyCottonXxlWhiteOrNot) {
      _amount =
          List<int>.generate(polyCottonXxlWhiteAmount, (index) => index + 1);
    } else if (polyCottonXlWhiteOrNot) {
      _amount =
          List<int>.generate(polyCottonXlWhiteAmount, (index) => index + 1);
    } else if (polyCottonLWhiteOrNot) {
      _amount =
          List<int>.generate(polyCottonLWhiteAmount, (index) => index + 1);
    } else if (polyCottonMWhiteOrNot) {
      _amount =
          List<int>.generate(polyCottonMWhiteAmount, (index) => index + 1);
    } else if (polyCottonXxlBlackOrNot) {
      _amount =
          List<int>.generate(polyCottonXxlBlackAmount, (index) => index + 1);
    } else if (polyCottonXlBlackOrNot) {
      _amount =
          List<int>.generate(polyCottonXlBlackAmount, (index) => index + 1);
    } else if (polyCottonLBlackOrNot) {
      _amount =
          List<int>.generate(polyCottonLBlackAmount, (index) => index + 1);
    } else if (polyCottonMBlackOrNot) {
      _amount =
          List<int>.generate(polyCottonMBlackAmount, (index) => index + 1);
    } else if (polyesterXxlWhiteOrNot) {
      _amount =
          List<int>.generate(polyesterXxlWhiteAmount, (index) => index + 1);
    } else if (polyesterXlWhiteOrNot) {
      _amount =
          List<int>.generate(polyesterXlWhiteAmount, (index) => index + 1);
    } else if (polyesterLWhiteOrNot) {
      _amount = List<int>.generate(polyesterLWhiteAmount, (index) => index + 1);
    } else if (polyesterMWhiteOrNot) {
      _amount = List<int>.generate(polyesterMWhiteAmount, (index) => index + 1);
    } else if (polyesterXxlBlackOrNot) {
      _amount =
          List<int>.generate(polyesterXxlBlackAmount, (index) => index + 1);
    } else if (polyesterXlBlackOrNot) {
      _amount =
          List<int>.generate(polyesterXlBlackAmount, (index) => index + 1);
    } else if (polyesterLBlackOrNot) {
      _amount = List<int>.generate(polyesterLBlackAmount, (index) => index + 1);
    } else if (polyesterMBlackOrNot) {
      _amount = List<int>.generate(polyesterMBlackAmount, (index) => index + 1);
    } else if (flatBagXxlWhiteOrNot) {
      _amount = List<int>.generate(flatBagXxlWhiteAmount, (index) => index + 1);
    } else if (flatBagXlWhiteOrNot) {
      _amount = List<int>.generate(flatBagXlWhiteAmount, (index) => index + 1);
    } else if (flatBagLWhiteOrNot) {
      _amount = List<int>.generate(flatBagLWhiteAmount, (index) => index + 1);
    } else if (flatBagMWhiteOrNot) {
      _amount = List<int>.generate(flatBagMWhiteAmount, (index) => index + 1);
    } else if (flatBagXxlBlackOrNot) {
      _amount = List<int>.generate(flatBagXxlBlackAmount, (index) => index + 1);
    } else if (flatBagXlBlackOrNot) {
      _amount = List<int>.generate(flatBagXlBlackAmount, (index) => index + 1);
    } else if (flatBagLBlackOrNot) {
      _amount = List<int>.generate(flatBagLBlackAmount, (index) => index + 1);
    } else if (flatBagMBlackOrNot) {
      _amount = List<int>.generate(flatBagMBlackAmount, (index) => index + 1);
    } else if (goldenOrNot) {
      _amount = List<int>.generate(goldenAmount, (index) => index + 1);
    } else if (goldenShineOrNot) {
      _amount = List<int>.generate(goldenShineAmount, (index) => index + 1);
    } else if (whiteOrNot) {
      _amount = List<int>.generate(whiteAmount, (index) => index + 1);
    } else if (blackOrNot) {
      _amount = List<int>.generate(blackAmount, (index) => index + 1);
    } else if (glassStickerOrNot) {
      _amount = List<int>.generate(glassStickerAmount, (index) => index + 1);
    }

    return _amount;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Customer>>(
      stream: _addOrderViewModel.customerList.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Error!');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Text('Loading');
          default:
            if (!snapshot.hasData) {
              return const Text('No data');
            }
        }

        List<Customer> customers = snapshot.data!;
        List<DropdownMenuItem> items = customers
            .map((customer) => DropdownMenuItem(
                  value: customer.id,
                  child: Text(customer.name),
                ))
            .toList();
        customerName = getCustomerName(customers);
        return Scaffold(
          appBar: AppBar(
            title: amharic ? const Text('አዲስ ትዕዛዝ') : const Text('New Order'),
          ),
          body: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: SizedBox(
                height: 500,
                child: Card(
                  //color: primaryColor,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 15.0,
                    ),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              amharic
                                  ? const Text(
                                      'ደንበኛ',
                                      style: subTitleTextStyle,
                                    )
                                  : const Text(
                                      'Customer',
                                      style: subTitleTextStyle,
                                    ),
                              const Spacer(),
                              Expanded(
                                child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return amharic
                                            ? 'ደንበኛ መምረጥ ግዴታ ነው'
                                            : 'Please select a Customer';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    items: items,
                                    value: _selectedCustomer,
                                    hint: amharic
                                        ? const Text('ደንበኛ')
                                        : const Text('Customer'),
                                    onChanged: (selected) {
                                      setState(() {
                                        _selectedCustomer = selected!;
                                      });
                                    }),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              amharic
                                  ? const Text(
                                      'የትዕዛዝ አይነት',
                                      style: subTitleTextStyle,
                                    )
                                  : const Text(
                                      'Choose Type',
                                      style: subTitleTextStyle,
                                    ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return amharic
                                            ? 'የትዕዛዝ አይነት ምረጥ/ጪ'
                                            : 'Please select order type';
                                      }
                                      return null;
                                    },
                                    items: _orderTypes,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    value: _selectedOrderType,
                                    hint: Row(
                                      children: [
                                        amharic
                                            ? const Text('የትዕዛዝ አይነት')
                                            : const Text('Order Type'),
                                      ],
                                    ),
                                    onChanged: (selected) {
                                      setState(() {
                                        _selectedOrderType = selected;
                                        if (selected == 'Mug') {
                                          whiteMugOrNot = true;
                                          polyCottonLWhiteOrNot = false;
                                          ovalStampOrNot = false;
                                          mugOrNot = true;
                                          plotOrNot = false;
                                          tshirtOrNot = false;
                                          flashStampOrNot = false;
                                          goldenOrNot = false;
                                        } else if (selected == 'Plot') {
                                          whiteMugOrNot = false;
                                          polyCottonLWhiteOrNot = false;
                                          ovalStampOrNot = false;
                                          plotOrNot = true;
                                          goldenOrNot = true;
                                          mugOrNot = false;
                                          tshirtOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'T-shirt') {
                                          whiteMugOrNot = false;
                                          ovalStampOrNot = false;
                                          polyCottonLWhiteOrNot = true;
                                          tshirtOrNot = true;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          goldenOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'Flash Stamp') {
                                          ovalStampOrNot = true;
                                          whiteMugOrNot = false;

                                          polyCottonLWhiteOrNot = false;

                                          tshirtOrNot = false;
                                          flashStampOrNot = true;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          goldenOrNot = false;
                                        } else if (selected == 'Others') {
                                          tshirtOrNot = false;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          flashStampOrNot = false;
                                        }
                                      });
                                    }),
                              ),
                            ],
                          ),
                          mugOrNot ? mugTypesWidget() : const SizedBox.shrink(),
                          plotOrNot
                              ? plotTypesWidget()
                              : const SizedBox.shrink(),
                          tshirtOrNot
                              ? tshirtTypesWidget()
                              : const SizedBox.shrink(),
                          flashStampOrNot
                              ? flashStampTypesWidget()
                              : const SizedBox.shrink(),
                          tshirtOrNot
                              ? const SizedBox.shrink()
                              : Row(
                                  children: [
                                    Expanded(
                                      child: amharic
                                          ? const Text(
                                              'ቅድሚያ የሚሰጠው',
                                              style: subTitleTextStyle,
                                            )
                                          : const Text(
                                              'Priority',
                                              style: subTitleTextStyle,
                                            ),
                                    ),
                                    // const Spacer(),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: DropdownButtonFormField(
                                          items: _priorities,
                                          validator: (value) {
                                            if (value == null) {
                                              return amharic
                                                  ? 'ቅድሚያ የሚሰጠውን አስገባ'
                                                  : 'Priority is required';
                                            }
                                            return null;
                                          },
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          value: _selectedPriority,
                                          onChanged: (selected) {
                                            setState(() {
                                              _selectedPriority = selected;
                                            });
                                          }),
                                    )
                                  ],
                                ),
                          amountWidget(),
                          Row(
                            children: [
                              amharic
                                  ? const Text(
                                      'የተከፈለ ብር',
                                      style: subTitleTextStyle,
                                    )
                                  : const Text(
                                      'Payment Made',
                                      style: subTitleTextStyle,
                                    ),
                              const Spacer(),
                              SizedBox(
                                width: 100,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return amharic
                                          ? 'የተከፈለ ብር ማስገባት ግዴታ ነው'
                                          : 'Payment made is required';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: _paymentController,
                                  decoration: InputDecoration(
                                      hintText: '\$\$\$',
                                      suffixText: amharic ? ' ብር' : ' Birr'),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          amharic
                              ? const Text(
                                  'የትዕዛዝ መግለጫ',
                                  style: subTitleTextStyle,
                                )
                              : const Text(
                                  'Instruction',
                                  style: subTitleTextStyle,
                                ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: _commentController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              authenticate(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                            child: amharic
                                ? const Text('ትዕዛዝ ጨምር')
                                : const Text('Add Order'),
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
      },
    );
  }

  Widget plotTypesWidget() {
    return Row(
      children: [
        Row(
          children: [
            amharic
                ? const Text(
                    'የፕሎት አይነት',
                    style: subTitleTextStyle,
                  )
                : const Text(
                    'Plot Type',
                    style: subTitleTextStyle,
                  ),
          ],
        ),
        const Spacer(),
        DropdownButton(
            items: _plotTypes,
            value: _selectedPlot,
            onChanged: (selected) {
              setState(() {
                _selectedPlot = selected;
                _selectedAmount = 1;
                if (selected == 'Golden Shine Vinyl') {
                  whiteMugOrNot = false;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = true;
                  whiteOrNot = false;
                  blackOrNot = false;
                  glassStickerOrNot = false;
                } else if (selected == 'White Vinyl') {
                  whiteMugOrNot = false;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = false;
                  whiteOrNot = true;
                  blackOrNot = false;
                  glassStickerOrNot = false;
                } else if (selected == 'Black Vinyl') {
                  whiteMugOrNot = false;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = false;
                  whiteOrNot = false;
                  blackOrNot = true;
                  glassStickerOrNot = false;
                } else if (selected == 'Glass Sticker') {
                  whiteMugOrNot = false;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = false;
                  whiteOrNot = false;
                  blackOrNot = false;
                  glassStickerOrNot = true;
                } else {
                  whiteMugOrNot = false;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = true;
                  goldenShineOrNot = false;
                  whiteOrNot = false;
                  blackOrNot = false;
                  glassStickerOrNot = false;
                }
              });
            })
      ],
    );
  }

  Widget tshirtTypesWidget() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          amharic
              ? const Text(
                  'የቲሸርት አይነት',
                  style: subTitleTextStyle,
                )
              : const Text(
                  'Tshirt Type',
                  style: subTitleTextStyle,
                ),
          const Spacer(),
          DropdownButton(
              items: _tshirtTypes,
              value: _selectedTshirt,
              onChanged: (selected) {
                setState(() {
                  _selectedTshirt = selected;
                  _selectedAmount = 1;
                  if (selected == 'Polyester Shirt') {
                    _selectedTshirtSize = tshirtSizes[1];
                    if (_selectedColor == 'Black') {
                      polyesterLBlackOrNot = true;
                    } else {
                      polyesterLWhiteOrNot = true;
                    }
                    whiteMugOrNot = false;
                    magicMugOrNot = false;

                    flatBagXxlWhiteOrNot = false;
                    flatBagXlWhiteOrNot = false;
                    flatBagLWhiteOrNot = false;
                    flatBagMWhiteOrNot = false;

                    polyesterXxlWhiteOrNot = false;
                    polyesterXlWhiteOrNot = false;

                    polyesterMWhiteOrNot = false;

                    polyCottonXxlWhiteOrNot = false;
                    polyCottonXlWhiteOrNot = false;
                    polyCottonLWhiteOrNot = false;
                    polyCottonMWhiteOrNot = false;

                    flatBagXxlBlackOrNot = false;
                    flatBagXlBlackOrNot = false;
                    flatBagLBlackOrNot = false;
                    flatBagMWhiteOrNot = false;

                    polyesterXxlBlackOrNot = false;
                    polyesterXlBlackOrNot = false;

                    polyesterMBlackOrNot = false;

                    polyCottonXxlBlackOrNot = false;
                    polyCottonXlBlackOrNot = false;
                    polyCottonLBlackOrNot = false;
                    polyCottonMBlackOrNot = false;

                    ovalStampOrNot = false;
                    headStampOrNOt = false;
                    fortyByTwentyStampOrNot = false;

                    goldenOrNot = false;
                    goldenShineOrNot = false;
                    whiteOrNot = false;
                    blackOrNot = false;
                    glassStickerOrNot = false;
                  } else if (selected == 'Flat-Bag Shirt') {
                    _selectedTshirtSize = tshirtSizes[1];
                    if (_selectedColor == 'Black') {
                      flatBagLBlackOrNot = true;
                    } else {
                      flatBagLWhiteOrNot = true;
                    }
                    whiteMugOrNot = false;
                    magicMugOrNot = false;
                    flatBagXxlWhiteOrNot = false;
                    flatBagXlWhiteOrNot = false;

                    flatBagMWhiteOrNot = false;
                    polyesterXxlWhiteOrNot = false;
                    polyesterXlWhiteOrNot = false;
                    polyesterLWhiteOrNot = false;
                    polyesterMWhiteOrNot = false;
                    polyCottonXxlWhiteOrNot = false;
                    polyCottonXlWhiteOrNot = false;
                    polyCottonLWhiteOrNot = false;
                    polyCottonMWhiteOrNot = false;
                    ovalStampOrNot = false;
                    headStampOrNOt = false;
                    fortyByTwentyStampOrNot = false;

                    flatBagXxlBlackOrNot = false;
                    flatBagXlBlackOrNot = false;

                    flatBagMWhiteOrNot = false;

                    polyesterXxlBlackOrNot = false;
                    polyesterXlBlackOrNot = false;
                    polyesterLBlackOrNot = false;
                    polyesterMBlackOrNot = false;

                    polyCottonXxlBlackOrNot = false;
                    polyCottonXlBlackOrNot = false;
                    polyCottonLBlackOrNot = false;
                    polyCottonMBlackOrNot = false;

                    goldenOrNot = false;
                    goldenShineOrNot = false;
                    whiteOrNot = false;
                    blackOrNot = false;
                    glassStickerOrNot = false;
                  } else {
                    _selectedTshirtSize = tshirtSizes[1];
                    if (_selectedColor == 'Black') {
                      polyCottonLBlackOrNot = true;
                    } else {
                      polyCottonLWhiteOrNot = true;
                    }
                    whiteMugOrNot = false;
                    magicMugOrNot = false;
                    flatBagXxlWhiteOrNot = false;
                    flatBagXlWhiteOrNot = false;
                    flatBagLWhiteOrNot = false;
                    flatBagMWhiteOrNot = false;
                    polyesterXxlWhiteOrNot = false;
                    polyesterXlWhiteOrNot = false;
                    polyesterLWhiteOrNot = false;
                    polyesterMWhiteOrNot = false;
                    polyCottonXxlWhiteOrNot = false;
                    polyCottonXlWhiteOrNot = false;

                    polyCottonMWhiteOrNot = false;
                    ovalStampOrNot = false;
                    headStampOrNOt = false;
                    fortyByTwentyStampOrNot = false;

                    flatBagXxlBlackOrNot = false;
                    flatBagXlBlackOrNot = false;
                    flatBagLBlackOrNot = false;
                    flatBagMWhiteOrNot = false;

                    polyesterXxlBlackOrNot = false;
                    polyesterXlBlackOrNot = false;
                    polyesterLBlackOrNot = false;
                    polyesterMBlackOrNot = false;

                    polyCottonXxlBlackOrNot = false;
                    polyCottonXlBlackOrNot = false;
                    polyCottonMBlackOrNot = false;
                    polyCottonLBlackOrNot = false;

                    goldenOrNot = false;
                    goldenShineOrNot = false;
                    whiteOrNot = false;
                    blackOrNot = false;
                    glassStickerOrNot = false;
                  }
                });
              })
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            amharic ? 'ሳይዝ' : 'Size',
            style: subTitleTextStyle,
          ),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
              items: _tshirtSizes,
              value: _selectedTshirtSize,
              onChanged: (selected) {
                setState(() {
                  _selectedTshirtSize = selected;
                  _selectedAmount = 1;
                  if (_selectedTshirt == 'Polyester Shirt') {
                    if (_selectedColor == 'Black') {
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;

                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = true;

                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;

                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = true;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;

                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;

                        polyesterXxlBlackOrNot = true;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;

                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = true;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    } else {
                      //this else is for when color selected is white
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;

                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;

                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = true;

                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = true;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = true;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = true;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    }
                  } else if (_selectedTshirt == 'Flat-Bag Shirt') {
                    if (_selectedColor == 'Black') {
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = true;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = true;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = true;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = true;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    } else {
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = true;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = true;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = true;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = true;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    }
                  } else {
                    //selected tshirt is polycotton

                    if (_selectedColor == 'Black') {
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = true;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = true;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = true;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = true;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    } else {
                      if (selected == 'M') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = true;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = true;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else if (selected == 'XXL') {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = true;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = false;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      } else {
                        whiteMugOrNot = false;
                        magicMugOrNot = false;
                        flatBagXxlWhiteOrNot = false;
                        flatBagXlWhiteOrNot = false;
                        flatBagLWhiteOrNot = false;
                        flatBagMWhiteOrNot = false;
                        polyesterXxlWhiteOrNot = false;
                        polyesterXlWhiteOrNot = false;
                        polyesterLWhiteOrNot = false;
                        polyesterMWhiteOrNot = false;
                        polyCottonXxlWhiteOrNot = false;
                        polyCottonXlWhiteOrNot = false;
                        polyCottonLWhiteOrNot = true;
                        polyCottonMWhiteOrNot = false;

                        flatBagXxlBlackOrNot = false;
                        flatBagXlBlackOrNot = false;
                        flatBagLBlackOrNot = false;
                        flatBagMBlackOrNot = false;

                        polyesterXxlBlackOrNot = false;
                        polyesterXlBlackOrNot = false;
                        polyesterLBlackOrNot = false;
                        polyesterMBlackOrNot = false;

                        polyCottonXxlBlackOrNot = false;
                        polyCottonXlBlackOrNot = false;
                        polyCottonLBlackOrNot = false;
                        polyCottonMBlackOrNot = false;

                        ovalStampOrNot = false;
                        headStampOrNOt = false;
                        fortyByTwentyStampOrNot = false;

                        goldenOrNot = false;
                        goldenShineOrNot = false;
                        whiteOrNot = false;
                        blackOrNot = false;
                        glassStickerOrNot = false;
                      }
                    }
                  }
                });
              }), //here lies sizes
          const SizedBox(
            width: 20,
          ),
          Text(
            amharic ? 'ከለር' : 'Color',
            style: subTitleTextStyle,
          ),
          const SizedBox(
            width: 10,
          ),
          DropdownButton(
              items: _shirtColors,
              value: _selectedColor,
              onChanged: (selected) {
                setState(() {
                  _selectedColor = selected;
                  _selectedTshirtSize = tshirtSizes[1];
                  _selectedAmount = 1;
                  if (selected == "Black") {
                    if (_selectedTshirt == 'Flat-Bag Shirt') {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = false;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = false;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = false;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = true;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = false;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = false;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    } else if (_selectedTshirt == 'Polyester Shirt') {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = false;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = false;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = false;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = false;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = true;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = false;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    } else {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = false;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = false;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = false;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = false;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = false;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = true;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    }
                  } else {
                    if (_selectedTshirt == 'Flat-Bag Shirt') {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = true;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = false;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = false;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = false;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = false;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = false;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    } else if (_selectedTshirt == 'Polyester Shirt') {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = false;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = true;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = false;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = false;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = false;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = false;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    } else {
                      flatBagXxlWhiteOrNot = false;
                      flatBagXlWhiteOrNot = false;
                      flatBagLWhiteOrNot = false;
                      flatBagMWhiteOrNot = false;
                      polyesterXxlWhiteOrNot = false;
                      polyesterXlWhiteOrNot = false;
                      polyesterLWhiteOrNot = false;
                      polyesterMWhiteOrNot = false;
                      polyCottonXxlWhiteOrNot = false;
                      polyCottonXlWhiteOrNot = false;
                      polyCottonLWhiteOrNot = true;
                      polyCottonMWhiteOrNot = false;

                      flatBagXxlBlackOrNot = false;
                      flatBagXlBlackOrNot = false;
                      flatBagLBlackOrNot = false;
                      flatBagMBlackOrNot = false;

                      polyesterXxlBlackOrNot = false;
                      polyesterXlBlackOrNot = false;
                      polyesterLBlackOrNot = false;
                      polyesterMBlackOrNot = false;

                      polyCottonXxlBlackOrNot = false;
                      polyCottonXlBlackOrNot = false;
                      polyCottonLBlackOrNot = false;
                      polyCottonMBlackOrNot = false;

                      goldenOrNot = false;
                      goldenShineOrNot = false;
                      whiteOrNot = false;
                      blackOrNot = false;
                      glassStickerOrNot = false;
                    }
                  }
                });
              }),
        ],
      )
    ]);
  }

  Widget amountWidget() {
    return Row(
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
        StreamBuilder(
          stream: _addOrderViewModel.stalkAmountsController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('erroor');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading');
              default:
                if (!snapshot.hasData) {
                  return const Text('No data');
                }
            }
            Map<String, int> stalkAmounts = snapshot.data!;

            whiteMugAmount = stalkAmounts['White Mug']!;
            magicMugAmount = stalkAmounts['Magic Mug']!;
            ovalStampAmount = stalkAmounts['Oval Stamp']!;
            fortyByTwentyStampAmount = stalkAmounts['40x20 Stamp']!;
            headStampAmount = stalkAmounts['Head Stamp']!;

            polyCottonLWhiteAmount = stalkAmounts['Poly-Cotton White L']!;
            polyCottonMWhiteAmount = stalkAmounts['Poly-Cotton White M']!;
            polyCottonXlWhiteAmount = stalkAmounts['Poly-Cotton White XL']!;
            polyCottonXxlWhiteAmount = stalkAmounts['Poly-Cotton White XXL']!;

            polyCottonLBlackAmount = stalkAmounts['Poly-Cotton Black L']!;
            polyCottonMBlackAmount = stalkAmounts['Poly-Cotton Black M']!;
            polyCottonXlBlackAmount = stalkAmounts['Poly-Cotton Black XL']!;
            polyCottonXxlBlackAmount = stalkAmounts['Poly-Cotton Black XXL']!;

            polyesterLWhiteAmount = stalkAmounts['Polyester White L']!;
            polyesterXlWhiteAmount = stalkAmounts['Polyester White XL']!;
            polyesterMWhiteAmount = stalkAmounts['Polyester White M']!;
            polyesterXxlWhiteAmount = stalkAmounts['Polyester White XXL']!;

            polyesterLBlackAmount = stalkAmounts['Polyester Black L']!;
            polyesterXlBlackAmount = stalkAmounts['Polyester Black XL']!;
            polyesterMBlackAmount = stalkAmounts['Polyester Black M']!;
            polyesterXxlBlackAmount = stalkAmounts['Polyester Black XXL']!;

            flatBagLWhiteAmount = stalkAmounts['Flat-Bag White L']!;
            flatBagXlWhiteAmount = stalkAmounts['Flat-Bag White XL']!;
            flatBagXxlWhiteAmount = stalkAmounts['Flat-Bag White XXL']!;
            flatBagMWhiteAmount = stalkAmounts['Flat-Bag White M']!;

            flatBagLBlackAmount = stalkAmounts['Flat-Bag Black L']!;
            flatBagXlBlackAmount = stalkAmounts['Flat-Bag Black XL']!;
            flatBagXxlBlackAmount = stalkAmounts['Flat-Bag Black XXL']!;
            flatBagMBlackAmount = stalkAmounts['Flat-Bag Black M']!;

            goldenAmount = stalkAmounts['Golden Vinyl']!;
            goldenShineAmount = stalkAmounts['Golden Shine Vinyl']!;
            whiteAmount = stalkAmounts['White Vinyl']!;
            blackAmount = stalkAmounts['Black Vinyl']!;
            glassStickerAmount = stalkAmounts['Glass Sticker']!;

            List<DropdownMenuItem> _amountList = getAvailableAmount()
                .map(
                  (amount) => DropdownMenuItem(
                    value: amount,
                    child: Text(
                      amount.toString(),
                    ),
                  ),
                )
                .toList();

            return DropdownButton(
                items: _amountList,
                value: _selectedAmount,
                onChanged: (selected) {
                  setState(() {
                    _selectedAmount = selected;
                  });
                });
          },
        )
      ],
    );
  }

  Widget flashStampTypesWidget() {
    return Row(
      children: [
        Text(
          amharic ? 'የማህተም አይነት' : 'Flash stamp type',
          style: subTitleTextStyle,
        ),
        const Spacer(),
        DropdownButton(
          items: _flashStampTypes,
          onChanged: (selected) {
            setState(() {
              _selectedStamp = selected;
              _selectedAmount = 1;
              if (selected == '40x20 Stamp') {
                whiteMugOrNot = false;
                magicMugOrNot = false;
                flatBagXxlWhiteOrNot = false;
                flatBagXlWhiteOrNot = false;
                flatBagLWhiteOrNot = false;
                flatBagMWhiteOrNot = false;
                polyesterXxlWhiteOrNot = false;
                polyesterXlWhiteOrNot = false;
                polyesterLWhiteOrNot = false;
                polyesterMWhiteOrNot = false;
                polyCottonXxlWhiteOrNot = false;
                polyCottonXlWhiteOrNot = false;
                polyCottonLWhiteOrNot = false;
                polyCottonMWhiteOrNot = false;

                flatBagXxlBlackOrNot = false;
                flatBagXlBlackOrNot = false;
                flatBagLBlackOrNot = false;
                flatBagMWhiteOrNot = false;

                polyesterXxlBlackOrNot = false;
                polyesterXlBlackOrNot = false;
                polyesterLBlackOrNot = false;
                polyesterMBlackOrNot = false;

                polyCottonXxlBlackOrNot = false;
                polyCottonXlBlackOrNot = false;
                polyCottonLBlackOrNot = false;
                polyCottonMBlackOrNot = false;

                ovalStampOrNot = false;
                headStampOrNOt = false;
                fortyByTwentyStampOrNot = true;

                goldenOrNot = false;
                goldenShineOrNot = false;
                whiteOrNot = false;
                blackOrNot = false;
                glassStickerOrNot = false;
              } else if (selected == 'Head Stamp') {
                whiteMugOrNot = false;
                magicMugOrNot = false;
                flatBagXxlWhiteOrNot = false;
                flatBagXlWhiteOrNot = false;
                flatBagLWhiteOrNot = false;
                flatBagMWhiteOrNot = false;
                polyesterXxlWhiteOrNot = false;
                polyesterXlWhiteOrNot = false;
                polyesterLWhiteOrNot = false;
                polyesterMWhiteOrNot = false;
                polyCottonXxlWhiteOrNot = false;
                polyCottonXlWhiteOrNot = false;
                polyCottonLWhiteOrNot = false;
                polyCottonMWhiteOrNot = false;

                flatBagXxlBlackOrNot = false;
                flatBagXlBlackOrNot = false;
                flatBagLBlackOrNot = false;
                flatBagMWhiteOrNot = false;

                polyesterXxlBlackOrNot = false;
                polyesterXlBlackOrNot = false;
                polyesterLBlackOrNot = false;
                polyesterMBlackOrNot = false;

                polyCottonXxlBlackOrNot = false;
                polyCottonXlBlackOrNot = false;
                polyCottonLBlackOrNot = false;
                polyCottonMBlackOrNot = false;

                ovalStampOrNot = false;
                headStampOrNOt = true;
                fortyByTwentyStampOrNot = false;

                goldenOrNot = false;
                goldenShineOrNot = false;
                whiteOrNot = false;
                blackOrNot = false;
                glassStickerOrNot = false;
              } else {
                whiteMugOrNot = false;
                magicMugOrNot = false;
                flatBagXxlWhiteOrNot = false;
                flatBagXlWhiteOrNot = false;
                flatBagLWhiteOrNot = false;
                flatBagMWhiteOrNot = false;
                polyesterXxlWhiteOrNot = false;
                polyesterXlWhiteOrNot = false;
                polyesterLWhiteOrNot = false;
                polyesterMWhiteOrNot = false;
                polyCottonXxlWhiteOrNot = false;
                polyCottonXlWhiteOrNot = false;
                polyCottonLWhiteOrNot = false;
                polyCottonMWhiteOrNot = false;

                flatBagXxlBlackOrNot = false;
                flatBagXlBlackOrNot = false;
                flatBagLBlackOrNot = false;
                flatBagMWhiteOrNot = false;

                polyesterXxlBlackOrNot = false;
                polyesterXlBlackOrNot = false;
                polyesterLBlackOrNot = false;
                polyesterMBlackOrNot = false;

                polyCottonXxlBlackOrNot = false;
                polyCottonXlBlackOrNot = false;
                polyCottonLBlackOrNot = false;
                polyCottonMBlackOrNot = false;

                ovalStampOrNot = true;
                headStampOrNOt = false;
                fortyByTwentyStampOrNot = false;

                goldenOrNot = false;
                goldenShineOrNot = false;
                whiteOrNot = false;
                blackOrNot = false;
                glassStickerOrNot = false;
              }
            });
          },
          value: _selectedStamp,
        )
      ],
    );
  }

  Widget mugTypesWidget() {
    return Row(
      children: [
        amharic
            ? const Text(
                'የኩባያ አይነት',
                style: subTitleTextStyle,
              )
            : const Text(
                'Mug Type',
                style: subTitleTextStyle,
              ),
        const Spacer(),
        DropdownButton(
            items: _mugTypes,
            value: _selectedMug,
            onChanged: (selected) {
              setState(() {
                _selectedMug = selected;
                _selectedAmount = 1;

                if (selected == 'Magic Mug') {
                  whiteMugOrNot = false;
                  magicMugOrNot = true;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = false;
                  whiteOrNot = false;
                  blackOrNot = false;
                  glassStickerOrNot = false;
                } else {
                  whiteMugOrNot = true;
                  magicMugOrNot = false;

                  flatBagXxlWhiteOrNot = false;
                  flatBagXlWhiteOrNot = false;
                  flatBagLWhiteOrNot = false;
                  flatBagMWhiteOrNot = false;

                  flatBagXxlBlackOrNot = false;
                  flatBagXlBlackOrNot = false;
                  flatBagLBlackOrNot = false;
                  flatBagMBlackOrNot = false;

                  polyesterXxlWhiteOrNot = false;
                  polyesterXlWhiteOrNot = false;
                  polyesterLWhiteOrNot = false;
                  polyesterMWhiteOrNot = false;

                  polyesterXxlBlackOrNot = false;
                  polyesterXlBlackOrNot = false;
                  polyesterLBlackOrNot = false;
                  polyesterMBlackOrNot = false;

                  polyCottonXxlWhiteOrNot = false;
                  polyCottonXlWhiteOrNot = false;
                  polyCottonLWhiteOrNot = false;
                  polyCottonMWhiteOrNot = false;

                  polyCottonXxlBlackOrNot = false;
                  polyCottonXlBlackOrNot = false;
                  polyCottonLBlackOrNot = false;
                  polyCottonMBlackOrNot = false;

                  ovalStampOrNot = false;
                  headStampOrNOt = false;
                  fortyByTwentyStampOrNot = false;

                  goldenOrNot = false;
                  goldenShineOrNot = false;
                  whiteOrNot = false;
                  blackOrNot = false;
                  glassStickerOrNot = false;
                }
              });
            })
      ],
    );
  }
}

List<DropdownMenuItem> _orderTypes = orderTypes
    .map((orderType) => DropdownMenuItem(
          value: orderType.name,
          child: amharic ? Text(orderType.amharicName) : Text(orderType.name),
        ))
    .toList();

List<DropdownMenuItem> _priorities = priorities2
    .map(
      (priority) => DropdownMenuItem(
        value: priority.priorityType.name,
        child: amharic
            ? Text(priority.priorityType.amharicName)
            : Text(priority.priorityType.name),
      ),
    )
    .toList();

List<DropdownMenuItem> _mugTypes = //OrderResource().
    mugTypes
        //.mugTypesList //mugTypes
        .map(
          (mugType) => DropdownMenuItem(
            value: mugType.name,
            child: amharic
                ? Text(mugType.amharicName)
                : Text(
                    mugType.name,
                  ),
          ),
        )
        .toList();
List<DropdownMenuItem> _plotTypes = //OrderResource().
    plotTypes
        //.plotTypesList //plotTypes
        .map(
          (plotType) => DropdownMenuItem(
            value: plotType.name,
            child: amharic ? Text(plotType.amharicName) : Text(plotType.name),
          ),
        )
        .toList();

List<DropdownMenuItem> _tshirtTypes = tshirtTypes
    .map(
      (tshirt) => DropdownMenuItem(
        value: tshirt.name,
        child: amharic
            ? Text(tshirt.amharicName)
            : Text(
                tshirt.name,
              ),
      ),
    )
    .toList();

List<DropdownMenuItem> _tshirtSizes = tshirtSizes
    .map(
      (size) => DropdownMenuItem(
        value: size,
        child: Text(size),
      ),
    )
    .toList();

List<DropdownMenuItem> _shirtColors = colorSelection
    .map(
      (colorObject) => DropdownMenuItem(
        value: colorObject.name,
        child:
            // Text(
            //   colorObject.name,
            // ),

            Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: colorObject.color,
                border: Border.all(color: Colors.black87),
              ),
              width: 20,
              height: 10,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(colorObject.name)
          ],
        ),
      ),
    )
    .toList();

List<DropdownMenuItem> _flashStampTypes = //OrderResource()
    flashStampTypes
        //.flashStampTypesList //flashStampTypes
        .map((flashStampType) => DropdownMenuItem(
              value: flashStampType.name,
              child: Text(
                  amharic ? flashStampType.amharicName : flashStampType.name),
            ))
        .toList();
