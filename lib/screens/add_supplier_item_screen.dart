import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../objects/supplier.dart';
import '../utilities/constants.dart';
import '../view_model/add_supplier_item_view_model.dart';

import '../main.dart';

class AddSupplierItemScreen extends StatefulWidget {
  final Supplier supplier;
  const AddSupplierItemScreen({Key? key, required this.supplier})
      : super(key: key);

  @override
  State<AddSupplierItemScreen> createState() => _AddSupplierItemScreenState();
}

class _AddSupplierItemScreenState extends State<AddSupplierItemScreen> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _measurementController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddSupplierItemViewModel _addSupplierItemViewModel =
      AddSupplierItemViewModel();

  bool addItem() {
    bool added = false;
    if (_formKey.currentState!.validate()) {
      String itemOrServiceName = _itemController.text;
      String price = _priceController.text;
      String measurement = _measurementController.text;
      _addSupplierItemViewModel.addSupplierItem(
          supplier: widget.supplier,
          itemOrServiceName: itemOrServiceName,
          price: price,
          measurement: measurement);
      added = true;
    }
    return added;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            amharic ? 'ዕቃ መጨመሪያ' : 'Adding to ${widget.supplier.companyName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  amharic ? 'ዕቃ/አገልግሎት' : 'Item/Service',
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _itemController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return amharic
                          ? 'ዕቃ/አገልግሎት ማስገባት ያስፈልጋል'
                          : 'Item/Service is required';
                    }
                    return null;
                  },
                  decoration: userInputDecoration(
                      amharic ? 'ዕቃ/አገልግሎት' : 'Item/Service',
                      const Icon(Icons.home_repair_service_rounded)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  amharic ? 'ዋጋ' : 'Price',
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _priceController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return amharic ? 'ዋጋ ማስገባት ያስፈልጋል' : 'Price is required';
                    }
                    return null;
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: userInputDecoration(
                    amharic ? 'ዋጋ' : 'Price',
                    const Icon(Icons.monetization_on_outlined),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  amharic ? 'መለኪያ' : 'Measurement',
                  style: subTitleTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _measurementController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return amharic
                          ? 'መለኪያ ያስፈልጋል'
                          : 'Measurement is required';
                    }
                    return null;
                  },
                  decoration: userInputDecoration(
                      amharic ? 'መለኪያ' : 'Measurement',
                      const Icon(Icons.r_mobiledata)),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    bool isSaved = addItem();
                    if (isSaved) {
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  child: Text(amharic ? 'ዕቃ/አገልግሎት ጨምር' : 'Add Item/Service'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
