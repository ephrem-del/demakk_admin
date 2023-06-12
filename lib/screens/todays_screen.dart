// import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/customer_detail_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../objects/order.dart';
import '../widgets/customer_order_tile.dart';

class TodayScreen extends StatefulWidget {
  final Customer customer;
  const TodayScreen({Key? key, required this.customer}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  late final CustomerDetailScreenViewModel customerDetailScreenViewModel;

  @override
  void initState() {
    super.initState();
    customerDetailScreenViewModel =
        CustomerDetailScreenViewModel(customer: widget.customer);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: customerDetailScreenViewModel.todaysOrdersController.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Snapshot Error');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...');
            default:
              if (!snapshot.hasData) {
                return const Text('No Data');
              }
          }
          List<Order> orders = snapshot.data!;
          return ListView(
            children: orders
                .map((order) => CustomerOrderTile(
                      customer: widget.customer,
                      order: order,
                    ))
                .toList(),
          );
        });
  }
}
