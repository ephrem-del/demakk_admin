import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../view_model/add_customer_view_model.dart';

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({Key? key}) : super(key: key);

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AddCustomerViewModel _addCustomerViewModel = AddCustomerViewModel();

  void _authenticate(BuildContext context) {
    String _name = _nameController.text;
    String _address = _addressController.text;
    String _phoneNumber = _phoneNumberController.text;

    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: amharic
                  ? const Text('ደንበኛ በመጨመር ላይ')
                  : const Text('Adding Customer'),
              content: amharic
                  ? const Text('አዲስ ደንበኛ መጨመር ትፈልጋለህ/ሽ?')
                  : const Text('Are you sure you want to add a new customer?'),
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
                  onPressed: () async {
                    await _addCustomerViewModel.addCustomer(
                        _name, _phoneNumber, _address);
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
        title: amharic ? const Text('አዲስ ደንበኛ') : const Text('Add Customer'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: SingleChildScrollView(
          //height: 400,
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  amharic
                      ? const Text(
                          'የደንበኛ ስም',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Customer Name',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'የደንበኛ ስም ማስገባት ግዴታ ነው'
                            : 'Customer name is required';
                      }
                    },
                    controller: _nameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: amharic
                        ? userInputDecoration(
                            'የደንበኛ ስም አበበ፣ ጫላ ...',
                            const Icon(Icons.person),
                          )
                        : userInputDecoration(
                            'Customer Name  Abebe, Chala ...',
                            const Icon(Icons.person),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  amharic
                      ? const Text(
                          'ስልክ ቁጥር',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Phone Number',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'ስልክ ቁጥር ማስገባት ግዴታ ነው'
                            : 'Phone number is required';
                      } else if (value.length < 10 || value.length > 10) {
                        return amharic
                            ? 'ስልክ ቁጥር 10ዲጅት መሆን አለበት'
                            : 'Phone number must be 10 digits';
                      }
                    },
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _phoneNumberController,
                    decoration: amharic
                        ? userInputDecoration(
                            'ስልክ ቁጥር 09********',
                            const Icon(Icons.phone),
                          )
                        : userInputDecoration(
                            'Phone Number 09********',
                            const Icon(Icons.phone),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  amharic
                      ? const Text(
                          'አድራሻ',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Address',
                          style: subTitleTextStyle,
                        ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return amharic
                            ? 'አድራሻ ማስገባት ግዴታ ነው'
                            : 'Adress is required';
                      }
                    },
                    controller: _addressController,
                    decoration: amharic
                        ? userInputDecoration(
                            'አድራሻ እፎይታ BS045-34, B1-040 ...',
                            const Icon(Icons.location_on),
                          )
                        : userInputDecoration(
                            'Address Efoyta BS045-34, B1-040 ...',
                            const Icon(Icons.location_on),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                    ),
                    onPressed: () {
                      _authenticate(context);
                    },
                    child: amharic
                        ? const Text('ደንበኛ ጨምር')
                        : const Text('Add Customer'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
