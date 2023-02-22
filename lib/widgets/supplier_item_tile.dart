import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../objects/supplier.dart';
import '../objects/supplier_items_and_services.dart';
import '../view_model/supplier_detail_screen_view_model.dart';

class SupplierItemTile extends StatefulWidget {
  final SupplierItemsAndServices supplierItemsAndServices;
  final Supplier supplier;
  SupplierItemTile(
      {Key? key,
      required this.supplierItemsAndServices,
      required this.supplier})
      : super(key: key);

  @override
  State<SupplierItemTile> createState() => _SupplierItemTileState();
}

class _SupplierItemTileState extends State<SupplierItemTile> {
  final TextEditingController _newPriceController = TextEditingController();

  final TextEditingController _userNameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final SupplierDetailScreenViewModel _supplierDetailScreenViewModel;

  void initState() {
    _supplierDetailScreenViewModel =
        SupplierDetailScreenViewModel(supplier: widget.supplier);
  }

  bool deleteItem() {
    bool deleted = false;
    if (_formKey.currentState!.validate()) {
      _supplierDetailScreenViewModel
          .deleteItem(widget.supplierItemsAndServices);
      deleted = true;
    }
    return deleted;
  }

  bool updateItem() {
    String price = _newPriceController.text;
    bool updated = false;
    if (_formKey.currentState!.validate()) {
      _supplierDetailScreenViewModel.updateItem(
          widget.supplierItemsAndServices, price);
      updated = true;
    }
    return updated;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.supplierItemsAndServices.itemOrServiceName,
                    style: subTitleTextStyle,
                  ),
                  Spacer(),
                  Text(
                      '${widget.supplierItemsAndServices.price.toString()} / ${widget.supplierItemsAndServices.measurement}')
                ],
              ),
              Divider(
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  amharic ? Text('ማስተካከል') : Text('Edit'),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: amharic
                                  ? Text('ዋጋ አስተካከል')
                                  : Text('Edit Price'),
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    amharic
                                        ? Text(
                                            'የድሮ ዋጋ: ${widget.supplierItemsAndServices.price.toString()}')
                                        : Text(
                                            'Previous price: ${widget.supplierItemsAndServices.price.toString()}'),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'አዲሱ ዋጋ',
                                              Icon(Icons
                                                  .monetization_on_outlined),
                                            ),
                                            controller: _newPriceController,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return amharic
                                                    ? 'አዲስ ዋጋ ያስፈልጋል'
                                                    : 'New Price is required';
                                              }
                                            },
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: TextInputType.number,
                                          )
                                        : TextFormField(
                                            decoration: userInputDecoration(
                                              'New Price',
                                              Icon(Icons
                                                  .monetization_on_outlined),
                                            ),
                                            controller: _newPriceController,
                                          ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'የተጠቃሚ ስም',
                                              Icon(
                                                Icons.person,
                                              ),
                                            ),
                                            controller: _userNameController,
                                          )
                                        : TextFormField(
                                            decoration: userInputDecoration(
                                              'UserName',
                                              Icon(
                                                Icons.person,
                                              ),
                                            ),
                                            controller: _userNameController,
                                          ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'የሚስጥር ቁጥር',
                                              Icon(
                                                Icons.password,
                                              ),
                                            ),
                                            controller: _passwordController,
                                          )
                                        : TextFormField(
                                            decoration: userInputDecoration(
                                              'Password',
                                              Icon(
                                                Icons.password,
                                              ),
                                            ),
                                            controller: _passwordController,
                                          )
                                  ],
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: amharic ? Text('ሰርዝ') : Text('Cancel'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFFB7B3B3))),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    bool updated = updateItem();
                                    if (updated) {
                                      Navigator.pop(context);
                                      _newPriceController.clear();
                                      _userNameController.clear();
                                      _passwordController.clear();
                                    }
                                  },
                                  child:
                                      amharic ? Text('አስተካክል') : Text('Edit'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor)),
                                )
                              ],
                            );
                          });
                    },
                    icon: Icon(Icons.edit),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  amharic ? Text('አጥፋ') : Text('Delete'),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: amharic
                                  ? Text('ዕቃውን አጥፋ')
                                  : Text('Delete Item'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: amharic ? Text('ሰርዝ') : Text('Cancel'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Color(0xFFB7B3B3),
                                  )),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    bool deleted = deleteItem();
                                    if (deleted) {
                                      Navigator.pop(context);
                                      Navigator.pushNamed(
                                          context, '/home_screen');
                                    }
                                  },
                                  child: amharic ? Text('አጥፋ') : Text('Delete'),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    primaryColor,
                                  )),
                                )
                              ],
                              content: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    amharic
                                        ? Text(
                                            'ለማጥፋት ${widget.supplierItemsAndServices.itemOrServiceName} ዕቃ ወስነሃል?')
                                        : Text(
                                            'Are you sure you want to delete ${widget.supplierItemsAndServices.itemOrServiceName} item?'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _userNameController,
                                      decoration: userInputDecoration(
                                        amharic ? 'የተጠቃሚ ስም' : 'UserName',
                                        Icon(Icons.person),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: userInputDecoration(
                                        amharic ? 'የሚስጥር ቁጥር' : 'Password',
                                        Icon(Icons.password),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
