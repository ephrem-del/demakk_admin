import 'package:demakk_admin/screens/add_customer_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'add_supplier_screen.dart';

import '../main.dart';

class CustomerOrSupplierScreen extends StatelessWidget {
  const CustomerOrSupplierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddCustomerScreen();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: amharic
                    ? const Text('አዲስ ደንበኛ')
                    : const Text('Add Customer'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddSupplierScreen();
                  }));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: amharic
                    ? const Text('አዲስ አቅራቢ')
                    : const Text('Add Supplier'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
