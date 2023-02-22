import 'package:demakk_admin/screens/add_order_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/widgets/order_tile.dart';
import 'package:flutter/material.dart';

// import '../business_logic/order_processing.dart';
import '../objects/order.dart';
import '../view_model/order_screen_view_model.dart';
import 'order_or_customer_order_screen.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  OrderScreenViewModel _orderScreenViewModel = OrderScreenViewModel();

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   children: orderTiles,
    // );
    // orderTiles.add(OrderTile(
    //     order: Order(
    //         id: '0',
    //         type: OrderType(name: 'space', price: 0),
    //         amount: 0,
    //         comment: 'space'),
    //     emptyOrNot: true));
    //List<OrderTile> orderTiles = getUncompletedOrderTiles();

    return Scaffold(
      body: StreamBuilder(
          stream: _orderScreenViewModel.uncompletedOrdersController.stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Error');
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Text('Loading');
              default:
                if (!snapshot.hasData) {
                  return Text('No data');
                }
            }
            return ListView(
                children: snapshot.data!
                    .map((order) => OrderTile(
                          order: order,
                        ))
                    .toList() //orderTiles,
                );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return OrderOrCustomerOrderScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );

    //return Text('hello Orders here');
    // return ListView(
    //   shrinkWrap: true,
    //   children: orderTiles,
    // );
  }
}
