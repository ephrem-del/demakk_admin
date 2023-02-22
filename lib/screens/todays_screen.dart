import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../widgets/customer_order_tile.dart';

class TodayScreen extends StatelessWidget {
  final Customer customer;
  const TodayScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomerOrderTile(customer: customer)],
    );
  }
}
