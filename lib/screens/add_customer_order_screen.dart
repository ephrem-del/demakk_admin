import 'package:demakk_admin/resources/customer_list.dart';
import 'package:demakk_admin/resources/order_resource.dart';
import 'package:demakk_admin/resources/priorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:im_stepper/main.dart';
//import 'package:im_stepper/stepper.dart';

import '../objects/customer.dart';
import '../utilities/constants.dart';
import '../view_model/add_order_view_model.dart';

class AddCustomerOrderScreen extends StatefulWidget {
  const AddCustomerOrderScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerOrderScreen> createState() => _AddCustomerOrderScreenState();
}

class _AddCustomerOrderScreenState extends State<AddCustomerOrderScreen> {
  final TextEditingController _paymentController = TextEditingController();
  final TextEditingController _orderTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  bool plotOrNot = false;
  bool mugOrNot = false;
  bool tshirtOrNot = false;
  bool otherOrNot = false;
  bool flashStampOrNot = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddOrderViewModel _addOrderViewModel = AddOrderViewModel();

  void _authenticate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: amharic ? Text('ትዕዛዝ በመጨመር ላይ') : Text('Adding Order'),
              content: amharic
                  ? Text('አዲስ ትዕዛዝ መጨመር ትፈልጋለህ/ሽ?')
                  : Text('Are you sure you want to add an Order?'),
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
                  child: amharic ? Text('ሰርዝ') : Text('Cancel'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home_screen');
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  child: amharic ? Text('አዎ') : Text('Yes'),
                ),
                const SizedBox(
                  width: 11,
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<Customer> customers = _addOrderViewModel.customerList.stream.value;

    return StreamBuilder<List<Customer>>(
      stream: _addOrderViewModel.customerList.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text('Loading');
          default:
            if (!snapshot.hasData) {
              return Text('No Data');
            }
        }

        List<Customer> customers = snapshot.data!;
        List<DropdownMenuItem> _items = customers
            .map((customer) => DropdownMenuItem(
                  value: customer.name,
                  child: Text(customer.name),
                ))
            .toList();

        return Scaffold(
          appBar: AppBar(
            title:
                amharic ? Text('አዲስ የደንበኛ ትዕዛዝ') : Text('New Customer Order'),
          ),
          body: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: SizedBox(
                height: 500,
                child: Form(
                  key: _formKey,
                  child: Card(
                    //color: primaryColor,
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 15.0,
                      ),
                      child: ListView(
                        children: [
                          Row(
                            children: [
                              amharic
                                  ? Text(
                                      'የደንበኛ ስም',
                                      style: subTitleTextStyle,
                                    )
                                  : Text(
                                      'Customer Name',
                                      style: subTitleTextStyle,
                                    ),
                              const Spacer(),
                              Expanded(
                                child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return amharic
                                            ? 'የደንበኛ ስም ማስገባት ግዴታ ነው'
                                            : 'Customer name is required';
                                      }
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    items: _items,
                                    value: _selectedCustomer,
                                    hint: amharic
                                        ? Text('የደንበኛ ስም')
                                        : Text('Customer Name'),
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
                                  ? Text(
                                      'የትዕዛዝ አይነት',
                                      style: subTitleTextStyle,
                                    )
                                  : Text(
                                      'Choose Type',
                                      style: subTitleTextStyle,
                                    ),
                              SizedBox(
                                width: 40,
                              ),
                              Expanded(
                                child: DropdownButtonFormField(
                                    validator: (value) {
                                      if (value == null) {
                                        return amharic
                                            ? 'የትዕዛዝ አይነት ማስገባት ግዴታ ነው'
                                            : 'Order type is required';
                                      }
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    items: _orderTypes,
                                    value: _selectedOrderType,
                                    hint: amharic
                                        ? Text('የትዕዛዝ አይነት')
                                        : Text('Order Type'),
                                    onChanged: (selected) {
                                      setState(() {
                                        _selectedOrderType = selected;
                                        if (selected == 'Mug') {
                                          mugOrNot = true;
                                          plotOrNot = false;
                                          tshirtOrNot = false;
                                          otherOrNot = false;
                                        } else if (selected == 'Plot') {
                                          plotOrNot = true;
                                          mugOrNot = false;
                                          tshirtOrNot = false;
                                          otherOrNot = false;
                                          flashStampOrNot = false;
                                        } else if (selected == 'T-shirt') {
                                          tshirtOrNot = true;
                                          flashStampOrNot = false;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          otherOrNot = false;
                                        } else if (selected == 'Flash Stamp') {
                                          tshirtOrNot = false;
                                          flashStampOrNot = true;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          otherOrNot = false;
                                        } else if (selected == 'Other') {
                                          otherOrNot = true;
                                          flashStampOrNot = false;
                                          mugOrNot = false;
                                          plotOrNot = false;
                                          tshirtOrNot = false;
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
                                        ? Text(
                                            'የኩባያ አይነት',
                                            style: subTitleTextStyle,
                                          )
                                        : Text(
                                            'Mug Type',
                                            style: subTitleTextStyle,
                                          ),
                                    Spacer(),
                                    DropdownButton(
                                      items: _mugTypes,
                                      value: _selectedMug,
                                      onChanged: (selected) {
                                        _selectedMug = selected;
                                      },
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          plotOrNot
                              ? Row(
                                  children: [
                                    amharic
                                        ? Text(
                                            'የፕሎት አይነት',
                                            style: subTitleTextStyle,
                                          )
                                        : Text(
                                            'Plot Type',
                                            style: subTitleTextStyle,
                                          ),
                                    Spacer(),
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
                          flashStampOrNot
                              ? Row(
                                  children: [
                                    Text(
                                      amharic
                                          ? 'የማህተም አይነት'
                                          : 'Flash stamp type',
                                      style: subTitleTextStyle,
                                    ),
                                    Spacer(),
                                    DropdownButton(
                                      items: _flashStampTypes,
                                      onChanged: (selected) {
                                        setState(() {
                                          _selectedStamp = selected;
                                        });
                                      },
                                      value: _selectedStamp,
                                    )
                                  ],
                                )
                              : SizedBox.shrink(),
                          tshirtOrNot
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        amharic
                                            ? Text(
                                                'የቲሸርት አይነት',
                                                style: subTitleTextStyle,
                                              )
                                            : Text(
                                                'Tshirt Type',
                                                style: subTitleTextStyle,
                                              ),
                                        Spacer(),
                                        DropdownButton(
                                            items: _tshirtTypes,
                                            value: _selectedTshirt,
                                            onChanged: (selected) {
                                              setState(() {
                                                _selectedTshirt = selected;
                                              });
                                            })
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        amharic
                                            ? Text(
                                                'ሳይዝ',
                                                style: subTitleTextStyle,
                                              )
                                            : Text(
                                                'Size',
                                                style: subTitleTextStyle,
                                              ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        DropdownButton(
                                            items: _tshirtSizes,
                                            value: _selectedTshirtSize,
                                            onChanged: (selected) {
                                              setState(() {
                                                _selectedTshirtSize = selected;
                                              });
                                            }),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        amharic
                                            ? Text(
                                                'ከለር',
                                                style: subTitleTextStyle,
                                              )
                                            : Text(
                                                'Color',
                                                style: subTitleTextStyle,
                                              ),
                                        SizedBox(
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
                              : SizedBox.shrink(),
                          otherOrNot
                              ? Column(
                                  children: [
                                    Row(
                                      children: [
                                        amharic
                                            ? Text(
                                                'የትዕዛዝ አይነት',
                                                style: subTitleTextStyle,
                                              )
                                            : Text(
                                                'Order type',
                                                style: subTitleTextStyle,
                                              ),
                                        Spacer(),
                                        SizedBox(
                                          width: 100,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (otherOrNot) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return amharic
                                                      ? 'የትዕዛዝ አይነት ማስገባት ግዴታ ነው'
                                                      : 'Order type is required';
                                                }
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: _orderTypeController,
                                            decoration: InputDecoration(
                                              hintText: amharic
                                                  ? 'ባነር፣ ካርድ ...'
                                                  : 'Banner, Card ...',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        amharic
                                            ? Text(
                                                'ዋጋ',
                                                style: subTitleTextStyle,
                                              )
                                            : Text(
                                                'Price',
                                                style: subTitleTextStyle,
                                              ),
                                        Spacer(),
                                        SizedBox(
                                          width: 100,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (otherOrNot) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return amharic
                                                      ? 'ዋጋ ማስገባት ግዴታ ነው'
                                                      : 'Price is required';
                                                }
                                              }
                                            },
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: _priceController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              hintText: '\$\$\$',
                                              suffixText:
                                                  amharic ? 'ብር' : 'Birr',
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : SizedBox.shrink(),
                          tshirtOrNot
                              ? SizedBox.shrink()
                              : Row(
                                  children: [
                                    amharic
                                        ? Text(
                                            'ቅድሚያ የሚሰጠው',
                                            style: subTitleTextStyle,
                                          )
                                        : Text(
                                            'Priority',
                                            style: subTitleTextStyle,
                                          ),
                                    const Spacer(),
                                    DropdownButton(
                                        items: _priorities,
                                        value: _selectedPriority,
                                        onChanged: (selected) {
                                          setState(() {
                                            _selectedPriority = selected;
                                          });
                                        })
                                  ],
                                ),
                          Row(
                            children: [
                              amharic
                                  ? Text(
                                      'ብዛት',
                                      style: subTitleTextStyle,
                                    )
                                  : Text(
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
                          Row(
                            children: [
                              amharic
                                  ? Text(
                                      'የተከፈለ ብር',
                                      style: subTitleTextStyle,
                                    )
                                  : Text(
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
                                  keyboardType: TextInputType.number,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _paymentController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return amharic
                                          ? 'የተከፈለ ብር ማስገባት ግዴታ ነው'
                                          : 'Payment made is required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      hintText: '\$\$\$',
                                      suffixText: amharic ? 'ብር' : 'Birr'),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            child: amharic
                                ? Text(
                                    'የትዕዛዝ መግለጫ',
                                    style: subTitleTextStyle,
                                  )
                                : Text(
                                    'Instruction',
                                    style: subTitleTextStyle,
                                  ),
                            alignment: Alignment.topLeft,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 3,
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _authenticate(context);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                            child:
                                amharic ? Text('ትዕዛዝ ጨምር') : Text('Add Order'),
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

String _selectedStamp = flashStampTypes[0].name;
String? _selectedCustomer;
String? _selectedOrderType;
String _selectedMug = amharic ? mugTypes[0].amharicName : mugTypes[0].name;
String _selectedPlot = amharic ? plotTypes[0].amharicName : plotTypes[0].name;
String _selectedTshirt =
    amharic ? tshirtTypes[0].amharicName : tshirtTypes[0].name;
String _selectedTshirtSize = tshirtSizes[2];
// String _selectedColor = color;
// Color _selectedColor = Color(0xffffffff);
String _selectedColor = colorSelection[0].name;
String _selectedPriority = amharic
    ? priorities2[2].priorityType.amharicName
    : priorities2[2].priorityType.name;
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
        value: amharic
            ? priority.priorityType.amharicName
            : priority.priorityType.name,
        child: amharic
            ? Text(priority.priorityType.amharicName)
            : Text(priority.priorityType.name),
      ),
    )
    .toList();

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

List<DropdownMenuItem> _mugTypes = mugTypes
    .map(
      (mugType) => DropdownMenuItem(
        child: amharic
            ? Text(
                mugType.amharicName,
              )
            : Text(
                mugType.name,
              ),
        value: amharic ? mugType.amharicName : mugType.name,
      ),
    )
    .toList();
List<DropdownMenuItem> _plotTypes = plotTypes
    .map(
      (plotType) => DropdownMenuItem(
        child: amharic ? Text(plotType.amharicName) : Text(plotType.name),
        value: amharic ? plotType.amharicName : plotType.name,
      ),
    )
    .toList();

List<DropdownMenuItem> _tshirtTypes = tshirtTypes
    .map(
      (tshirt) => DropdownMenuItem(
        child: amharic
            ? Text(
                tshirt.amharicName,
              )
            : Text(
                tshirt.name,
              ),
        value: amharic ? tshirt.amharicName : tshirt.name,
      ),
    )
    .toList();

List<DropdownMenuItem> _tshirtSizes = tshirtSizes
    .map(
      (size) => DropdownMenuItem(
        child: Text(size),
        value: size,
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
            SizedBox(
              width: 5,
            ),
            amharic ? Text(colorObject.amharicName) : Text(colorObject.name)
          ],
        ),
      ),
    )
    .toList();

List<DropdownMenuItem> _flashStampTypes = flashStampTypes
    .map((flashStampType) => DropdownMenuItem(
          child:
              Text(amharic ? flashStampType.amharicName : flashStampType.name),
          value: flashStampType.name,
        ))
    .toList();
