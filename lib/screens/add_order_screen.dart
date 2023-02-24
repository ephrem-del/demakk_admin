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
import '../utilities/constants.dart';
import '../view_model/add_order_view_model.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  bool plotOrNot = false;
  bool mugOrNot = false;
  bool tshirtOrNot = false;
  bool flashStampOrNot = false;
  bool whiteMugOrNot = false;
  bool magicMugOrNot = false;
  bool flatBagXxlOrNot = false;
  bool flatBagXlOrNot = false;
  bool flatBagLOrNot = false;
  bool flatBagMOrNot = false;
  bool polyesterXxlOrNot = false;
  bool polyesterXlOrNot = false;
  bool polyesterLOrNot = false;
  bool polyesterMOrNot = false;
  bool polyCottonXxlOrNot = false;
  bool polyCottonXlOrNot = false;
  bool polyCottonLOrNot = false;
  bool polyCottonMOrNot = false;
  bool ovalStampOrNot = false;
  bool headStampOrNOt = false;
  bool fortyByTwentyStampOrNot = false;
  int whiteMugAmount = 0;
  int magicMugAmount = 0;
  int flatBagXxlAmount = 0;
  int flatBagXlAmount = 0;
  int flatBagLAmount = 0;
  int flatBagMAmount = 0;
  int polyesterXxlAmount = 0;
  int polyesterXlAmount = 0;
  int polyesterLAmount = 0;
  int polyesterMAmount = 0;
  int polyCottonXxlAmount = 0;
  int polyCottonXlAmount = 0;
  int polyCottonLAmount = 0;
  int polyCottonMAmount = 0;
  int ovalStampAmount = 0;
  int headStampAmount = 0;
  int fortyByTwentyStampAmount = 0;

  late OrderType type;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String customerName;

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
                    if (plotOrNot) {
                      type = plotTypesMap[_selectedPlot]!;
                    } else if (mugOrNot) {
                      type = mugTypesMap[_selectedMug]!;
                    } else if (tshirtOrNot) {
                      type = tshirtTypesMap[_selectedTshirt]!;
                    } else if (flashStampOrNot) {
                      type = flashStampTypesMap[_selectedStamp]!;
                    } else {
                      type = orderTypesMap['Other']!;
                    }

                    bool added = await _addOrderViewModel.addOrder(type, amount,
                        comment, priority, customerId, paid, customerName);
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
    } else if (polyCottonXxlOrNot) {
      _amount = List<int>.generate(polyCottonXxlAmount, (index) => index + 1);
    } else if (polyCottonXlOrNot) {
      _amount = List<int>.generate(polyCottonXlAmount, (index) => index + 1);
    } else if (polyCottonLOrNot) {
      _amount = List<int>.generate(polyCottonLAmount, (index) => index + 1);
    } else if (polyCottonMOrNot) {
      _amount = List<int>.generate(polyCottonMAmount, (index) => index + 1);
    } else if (polyesterXxlOrNot) {
      _amount = List<int>.generate(polyesterXxlAmount, (index) => index + 1);
    } else if (polyesterXlOrNot) {
      _amount = List<int>.generate(polyesterXlAmount, (index) => index + 1);
    } else if (polyesterLOrNot) {
      _amount = List<int>.generate(polyesterLAmount, (index) => index + 1);
    } else if (polyesterMOrNot) {
      _amount = List<int>.generate(polyesterMAmount, (index) => index + 1);
    } else if (flatBagXxlOrNot) {
      _amount = List<int>.generate(flatBagXxlAmount, (index) => index + 1);
    } else if (flatBagXlOrNot) {
      _amount = List<int>.generate(flatBagXlAmount, (index) => index + 1);
    } else if (flatBagLOrNot) {
      _amount = List<int>.generate(flatBagLAmount, (index) => index + 1);
    } else if (flatBagMOrNot) {
      _amount = List<int>.generate(flatBagMAmount, (index) => index + 1);
    }
    return _amount;
  }

  @override
  Widget build(BuildContext context) {
    // List<Customer> customers = _addOrderViewModel.customerList.stream.value;

    // List<DropdownMenuItem> _items = customers
    //     .map((customer) => DropdownMenuItem(
    //           value: customer.name,
    //           child: Text(customer.name),
    //         ))
    //     .toList();

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
                                          polyCottonLOrNot = false;
                                          ovalStampOrNot = false;
                                          mugOrNot = true;
                                          plotOrNot = false;
                                          tshirtOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'Plot') {
                                          plotOrNot = true;
                                          mugOrNot = false;
                                          tshirtOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'T-shirt') {
                                          whiteMugOrNot = false;

                                          ovalStampOrNot = false;

                                          polyCottonLOrNot = true;
                                          tshirtOrNot = true;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'Flash Stamp') {
                                          ovalStampOrNot = true;
                                          whiteMugOrNot = false;

                                          polyCottonLOrNot = false;

                                          tshirtOrNot = false;
                                          flashStampOrNot = true;
                                          mugOrNot = false;
                                          plotOrNot = false;
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
                          mugOrNot
                              ? Row(
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

                                            if (selected == 'Magic Mug') {
                                              whiteMugOrNot = false;
                                              magicMugOrNot = true;
                                              flatBagXxlOrNot = false;
                                              flatBagXlOrNot = false;
                                              flatBagLOrNot = false;
                                              flatBagMOrNot = false;
                                              polyesterXxlOrNot = false;
                                              polyesterXlOrNot = false;
                                              polyesterLOrNot = false;
                                              polyesterMOrNot = false;
                                              polyCottonXxlOrNot = false;
                                              polyCottonXlOrNot = false;
                                              polyCottonLOrNot = false;
                                              polyCottonMOrNot = false;
                                              ovalStampOrNot = false;
                                              headStampOrNOt = false;
                                              fortyByTwentyStampOrNot = false;
                                            } else {
                                              whiteMugOrNot = true;
                                              magicMugOrNot = false;
                                              flatBagXxlOrNot = false;
                                              flatBagXlOrNot = false;
                                              flatBagLOrNot = false;
                                              flatBagMOrNot = false;
                                              polyesterXxlOrNot = false;
                                              polyesterXlOrNot = false;
                                              polyesterLOrNot = false;
                                              polyesterMOrNot = false;
                                              polyCottonXxlOrNot = false;
                                              polyCottonXlOrNot = false;
                                              polyCottonLOrNot = false;
                                              polyCottonMOrNot = false;
                                              ovalStampOrNot = false;
                                              headStampOrNOt = false;
                                              fortyByTwentyStampOrNot = false;
                                            }
                                          });
                                        })
                                  ],
                                )
                              : const SizedBox.shrink(),
                          plotOrNot
                              ? Row(
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
                                          });
                                        })
                                  ],
                                )
                              : const SizedBox.shrink(),
                          tshirtOrNot
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                                if (selected ==
                                                    'Polyester Shirt') {
                                                  _selectedTshirtSize =
                                                      tshirtSizes[1];
                                                  whiteMugOrNot = false;
                                                  magicMugOrNot = false;
                                                  flatBagXxlOrNot = false;
                                                  flatBagXlOrNot = false;
                                                  flatBagLOrNot = false;
                                                  flatBagMOrNot = false;
                                                  polyesterXxlOrNot = false;
                                                  polyesterXlOrNot = false;
                                                  polyesterLOrNot = true;
                                                  polyesterMOrNot = false;
                                                  polyCottonXxlOrNot = false;
                                                  polyCottonXlOrNot = false;
                                                  polyCottonLOrNot = false;
                                                  polyCottonMOrNot = false;
                                                  ovalStampOrNot = false;
                                                  headStampOrNOt = false;
                                                  fortyByTwentyStampOrNot =
                                                      false;
                                                } else if (selected ==
                                                    'Flat-Bag Shirt') {
                                                  _selectedTshirtSize =
                                                      tshirtSizes[1];
                                                  whiteMugOrNot = false;
                                                  magicMugOrNot = false;
                                                  flatBagXxlOrNot = false;
                                                  flatBagXlOrNot = false;
                                                  flatBagLOrNot = true;
                                                  flatBagMOrNot = false;
                                                  polyesterXxlOrNot = false;
                                                  polyesterXlOrNot = false;
                                                  polyesterLOrNot = false;
                                                  polyesterMOrNot = false;
                                                  polyCottonXxlOrNot = false;
                                                  polyCottonXlOrNot = false;
                                                  polyCottonLOrNot = false;
                                                  polyCottonMOrNot = false;
                                                  ovalStampOrNot = false;
                                                  headStampOrNOt = false;
                                                  fortyByTwentyStampOrNot =
                                                      false;
                                                } else {
                                                  _selectedTshirtSize =
                                                      tshirtSizes[1];
                                                  whiteMugOrNot = false;
                                                  magicMugOrNot = false;
                                                  flatBagXxlOrNot = false;
                                                  flatBagXlOrNot = false;
                                                  flatBagLOrNot = false;
                                                  flatBagMOrNot = false;
                                                  polyesterXxlOrNot = false;
                                                  polyesterXlOrNot = false;
                                                  polyesterLOrNot = false;
                                                  polyesterMOrNot = false;
                                                  polyCottonXxlOrNot = false;
                                                  polyCottonXlOrNot = false;
                                                  polyCottonLOrNot = true;
                                                  polyCottonMOrNot = false;
                                                  ovalStampOrNot = false;
                                                  headStampOrNOt = false;
                                                  fortyByTwentyStampOrNot =
                                                      false;
                                                }
                                              });
                                            })
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                if (_selectedTshirt ==
                                                    'Polyester Shirt') {
                                                  if (selected == 'M') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = true;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected == 'XL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = true;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected ==
                                                      'XXL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = true;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = true;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  }
                                                } else if (_selectedTshirt ==
                                                    'Flat-Bag Shirt') {
                                                  if (selected == 'M') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = true;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected == 'XL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = true;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected ==
                                                      'XXL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = true;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = true;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  }
                                                } else {
                                                  if (selected == 'M') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = true;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected == 'XL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = true;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else if (selected ==
                                                      'XXL') {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = true;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = false;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  } else {
                                                    whiteMugOrNot = false;
                                                    magicMugOrNot = false;
                                                    flatBagXxlOrNot = false;
                                                    flatBagXlOrNot = false;
                                                    flatBagLOrNot = false;
                                                    flatBagMOrNot = false;
                                                    polyesterXxlOrNot = false;
                                                    polyesterXlOrNot = false;
                                                    polyesterLOrNot = false;
                                                    polyesterMOrNot = false;
                                                    polyCottonXxlOrNot = false;
                                                    polyCottonXlOrNot = false;
                                                    polyCottonLOrNot = true;
                                                    polyCottonMOrNot = false;
                                                    ovalStampOrNot = false;
                                                    headStampOrNOt = false;
                                                    fortyByTwentyStampOrNot =
                                                        false;
                                                  }
                                                }
                                              });
                                            }),
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
                                              });
                                            }),
                                      ],
                                    )
                                  ],
                                )
                              : const SizedBox.shrink(),
                          flashStampOrNot
                              ? Row(
                                  children: [
                                    Text(
                                      amharic
                                          ? 'የማህተም አይነት'
                                          : 'Flash stamp type',
                                      style: subTitleTextStyle,
                                    ),
                                    const Spacer(),
                                    DropdownButton(
                                      items: _flashStampTypes,
                                      onChanged: (selected) {
                                        setState(() {
                                          _selectedStamp = selected;
                                          if (selected == '40x20 Stamp') {
                                            whiteMugOrNot = false;
                                            magicMugOrNot = false;
                                            flatBagXxlOrNot = false;
                                            flatBagXlOrNot = false;
                                            flatBagLOrNot = false;
                                            flatBagMOrNot = false;
                                            polyesterXxlOrNot = false;
                                            polyesterXlOrNot = false;
                                            polyesterLOrNot = false;
                                            polyesterMOrNot = false;
                                            polyCottonXxlOrNot = false;
                                            polyCottonXlOrNot = false;
                                            polyCottonLOrNot = false;
                                            polyCottonMOrNot = false;
                                            ovalStampOrNot = false;
                                            headStampOrNOt = false;
                                            fortyByTwentyStampOrNot = true;
                                          } else if (selected == 'Head Stamp') {
                                            whiteMugOrNot = false;
                                            magicMugOrNot = false;
                                            flatBagXxlOrNot = false;
                                            flatBagXlOrNot = false;
                                            flatBagLOrNot = false;
                                            flatBagMOrNot = false;
                                            polyesterXxlOrNot = false;
                                            polyesterXlOrNot = false;
                                            polyesterLOrNot = false;
                                            polyesterMOrNot = false;
                                            polyCottonXxlOrNot = false;
                                            polyCottonXlOrNot = false;
                                            polyCottonLOrNot = false;
                                            polyCottonMOrNot = false;
                                            ovalStampOrNot = false;
                                            headStampOrNOt = true;
                                            fortyByTwentyStampOrNot = false;
                                          } else {
                                            whiteMugOrNot = false;
                                            magicMugOrNot = false;
                                            flatBagXxlOrNot = false;
                                            flatBagXlOrNot = false;
                                            flatBagLOrNot = false;
                                            flatBagMOrNot = false;
                                            polyesterXxlOrNot = false;
                                            polyesterXlOrNot = false;
                                            polyesterLOrNot = false;
                                            polyesterMOrNot = false;
                                            polyCottonXxlOrNot = false;
                                            polyCottonXlOrNot = false;
                                            polyCottonLOrNot = false;
                                            polyCottonMOrNot = false;
                                            ovalStampOrNot = true;
                                            headStampOrNOt = false;
                                            fortyByTwentyStampOrNot = false;
                                          }
                                        });
                                      },
                                      value: _selectedStamp,
                                    )
                                  ],
                                )
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
                              StreamBuilder(
                                stream: _addOrderViewModel
                                    .stalkAmountsController.stream,
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return Text('erroor');
                                  }
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Text('Loading');
                                    default:
                                      if (!snapshot.hasData) {
                                        return Text('No data');
                                      }
                                  }
                                  Map<String, int> stalkAmounts =
                                      snapshot.data!;

                                  whiteMugAmount = stalkAmounts['White Mug']!;
                                  magicMugAmount = stalkAmounts['Magic Mug']!;
                                  ovalStampAmount = stalkAmounts['Oval Stamp']!;
                                  fortyByTwentyStampAmount =
                                      stalkAmounts['40x20 Stamp']!;
                                  headStampAmount = stalkAmounts['Head Stamp']!;
                                  polyCottonLAmount = stalkAmounts['L-PCS']!;
                                  polyCottonMAmount = stalkAmounts['M-PCS']!;
                                  polyCottonXlAmount = stalkAmounts['XL-PCS']!;
                                  polyCottonXxlAmount =
                                      stalkAmounts['XXL-PCS']!;
                                  polyesterLAmount = stalkAmounts['L-PS']!;
                                  polyesterXlAmount = stalkAmounts['XL-PS']!;
                                  polyesterMAmount = stalkAmounts['M-PS']!;
                                  polyesterXxlAmount = stalkAmounts['XXL-PS']!;
                                  flatBagLAmount = stalkAmounts['L-FS']!;
                                  flatBagXlAmount = stalkAmounts['XL-FS']!;
                                  flatBagXxlAmount = stalkAmounts['XXL-FS']!;
                                  flatBagMAmount = stalkAmounts['M-FS']!;

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
                          ),
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
}

String? _selectedCustomer;
String? _selectedOrderType;
String _selectedMug = mugTypes[0].name;
String _selectedPlot = plotTypes[0].name;
String _selectedTshirt = tshirtTypes[0].name;
String _selectedTshirtSize = tshirtSizes[1];
String _selectedColor = colorSelection[0].name;
String _selectedStamp = flashStampTypes[0].name;
String _selectedPriority = priorities2[2].priorityType.name;
int _selectedAmount = 1;

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

List<DropdownMenuItem> _mugTypes = mugTypes
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
List<DropdownMenuItem> _plotTypes = plotTypes
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

List<DropdownMenuItem> _flashStampTypes = flashStampTypes
    .map((flashStampType) => DropdownMenuItem(
          value: flashStampType.name,
          child:
              Text(amharic ? flashStampType.amharicName : flashStampType.name),
        ))
    .toList();
