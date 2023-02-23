import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../objects/supplier.dart';
import '../objects/supplier_items_and_services.dart';
import '../view_model/supplier_detail_screen_view_model.dart';

class SupplierItemTile extends StatefulWidget {
  final SupplierItemsAndServices supplierItemsAndServices;
  final Supplier supplier;
  const SupplierItemTile(
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

  @override
  void initState() {
    super.initState();
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
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.supplierItemsAndServices.itemOrServiceName,
                    style: subTitleTextStyle,
                  ),
                  const Spacer(),
                  Text(
                      '${widget.supplierItemsAndServices.price.toString()} / ${widget.supplierItemsAndServices.measurement}')
                ],
              ),
              const Divider(
                color: primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  amharic ? const Text('ማስተካከል') : const Text('Edit'),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: amharic
                                  ? const Text('ዋጋ አስተካከል')
                                  : const Text('Edit Price'),
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
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'አዲሱ ዋጋ',
                                              const Icon(Icons
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
                                              return null;
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
                                              const Icon(Icons
                                                  .monetization_on_outlined),
                                            ),
                                            controller: _newPriceController,
                                          ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'የተጠቃሚ ስም',
                                              const Icon(
                                                Icons.person,
                                              ),
                                            ),
                                            controller: _userNameController,
                                          )
                                        : TextFormField(
                                            decoration: userInputDecoration(
                                              'UserName',
                                              const Icon(
                                                Icons.person,
                                              ),
                                            ),
                                            controller: _userNameController,
                                          ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    amharic
                                        ? TextFormField(
                                            decoration: userInputDecoration(
                                              'የሚስጥር ቁጥር',
                                              const Icon(
                                                Icons.password,
                                              ),
                                            ),
                                            controller: _passwordController,
                                          )
                                        : TextFormField(
                                            decoration: userInputDecoration(
                                              'Password',
                                              const Icon(
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
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color(0xFFB7B3B3))),
                                  child: amharic
                                      ? const Text('ሰርዝ')
                                      : const Text('Cancel'),
                                ),
                                const SizedBox(
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
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              primaryColor)),
                                  child: amharic
                                      ? const Text('አስተካክል')
                                      : const Text('Edit'),
                                )
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  amharic ? const Text('አጥፋ') : const Text('Delete'),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: amharic
                                  ? const Text('ዕቃውን አጥፋ')
                                  : const Text('Delete Item'),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    const Color(0xFFB7B3B3),
                                  )),
                                  child: amharic
                                      ? const Text('ሰርዝ')
                                      : const Text('Cancel'),
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
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    primaryColor,
                                  )),
                                  child: amharic
                                      ? const Text('አጥፋ')
                                      : const Text('Delete'),
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _userNameController,
                                      decoration: userInputDecoration(
                                        amharic ? 'የተጠቃሚ ስም' : 'UserName',
                                        const Icon(Icons.person),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      decoration: userInputDecoration(
                                        amharic ? 'የሚስጥር ቁጥር' : 'Password',
                                        const Icon(Icons.password),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                    icon: const Icon(Icons.delete),
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
