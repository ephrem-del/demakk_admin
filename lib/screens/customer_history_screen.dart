// import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../objects/order.dart';
import '../view_model/customer_detail_screen_view_model.dart';
import '../widgets/customer_order_tile.dart';

class CustomerHistoryScreen extends StatefulWidget {
  final Customer customer;
  const CustomerHistoryScreen({Key? key, required this.customer})
      : super(key: key);

  @override
  State<CustomerHistoryScreen> createState() => _CustomerHistoryScreenState();
}

class _CustomerHistoryScreenState extends State<CustomerHistoryScreen> {
  late final CustomerDetailScreenViewModel customerDetailScreenViewModel;

  @override
  void initState() {
    super.initState;
    customerDetailScreenViewModel =
        CustomerDetailScreenViewModel(customer: widget.customer);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: customerDetailScreenViewModel.allOrdersController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');
            default:
              if (!snapshot.hasData) {
                return Text('No Data');
              }
          }
          List<Order> orders = snapshot.data!;
          return ListView(
            children: orders
                .map((order) =>
                    CustomerOrderTile(customer: widget.customer, order: order))
                .toList(),
          );
        });
  }
}
