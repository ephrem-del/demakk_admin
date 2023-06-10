// import 'package:demakk_admin/screens/add_customer_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'add_customer_order_screen.dart';
import 'add_order_screen.dart';

import '../main.dart';
// import 'add_supplier_screen.dart';

class OrderOrCustomerOrderScreen extends StatelessWidget {
  const OrderOrCustomerOrderScreen({Key? key}) : super(key: key);

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
                    return const AddOrderScreen(); //return AddCustomerScreen();
                  }));
                }, //Text('Add Customer'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child:
                    amharic ? const Text('ትዕዛዝ ጨምር') : const Text('Add Order'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddCustomerOrderScreen();
                    // return AddSupplierScreen();
                  }));
                }, //Text('Add Supplier'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(primaryColor),
                ),
                child: amharic
                    ? const Text('ልዩ ትዕዛዝ ጨምር')
                    : const Text('Add Customer Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
