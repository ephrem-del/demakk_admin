import 'package:demakk_admin/objects/order.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/order_screen_view_model.dart';
import 'package:flutter/material.dart';

// import '../objects/customer.dart';

class OrderDetailScreen extends StatelessWidget {
  final OrderScreenViewModel _orderScreenViewModel = OrderScreenViewModel();
  //final Customer customer;
  final Order order;
  OrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  void _markAsCompleted() {
    _orderScreenViewModel.orderCompleted(order);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: amharic
            ? Text(
                'የ${order.customerName.toUpperCase()} ${order.type.amharicName}',
              )
            : Text(
                '${order.customerName.toUpperCase()} ${order.type.name.toUpperCase()}',
              ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.all(20.0),
          elevation: 20.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '${order.dateAndTime.month()}, ${order.dateAndTime.day()} ${order.dateAndTime.hour()}:${order.dateAndTime.minute()}',
                    style: subTitleTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                amharic
                    ? const Text(
                        'የደንበኛ መረጃ',
                        style: titleTextStyle,
                      )
                    : const Text(
                        'Customer Details',
                        style: titleTextStyle,
                      ),
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'የደንበኛ ስም :',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Customer Name :',
                            style: subTitleTextStyle,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      order.customerName,
                      style: otherTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'ስልክ ቁጥር :',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Phone Number :',
                            style: subTitleTextStyle,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    // Text(
                    //   customer.phoneNumber,
                    //   style: otherTextStyle,
                    // ),
                  ],
                ),
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'አድራሻ :',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Address :',
                            style: subTitleTextStyle,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    // Text(
                    //   customer.address,
                    //   style: otherTextStyle,
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                amharic
                    ? const Text(
                        'የትዕዛዝ መግለጫ',
                        style: titleTextStyle,
                      )
                    : const Text(
                        'Order Details',
                        style: titleTextStyle,
                      ),
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'አይነት :',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Order Type :',
                            style: subTitleTextStyle,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    amharic
                        ? Text(
                            order.type.amharicName,
                            style: otherTextStyle,
                          )
                        : Text(
                            order.type.name,
                            style: otherTextStyle,
                          ),
                  ],
                ),
                Row(
                  children: [
                    amharic
                        ? const Text(
                            'ዋጋ :',
                            style: subTitleTextStyle,
                          )
                        : const Text(
                            'Price :',
                            style: subTitleTextStyle,
                          ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      order.type.price.toString(),
                      style: otherTextStyle,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: amharic
                      ? const Text(
                          'ተጨማሪ ማብራርያ :',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Additional Comments :',
                          style: subTitleTextStyle,
                        ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    order.comment,
                    style: otherTextStyle,
                  ),
                ),
                const Spacer(),
                order.completed
                    ? Text(
                        amharic ? 'ትዕዛዝ ተጠናቋል' : 'Order is Completed',
                        style: subTitleTextStyle,
                      )
                    : Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: amharic
                                        ? Text(
                                            'የ${order.customerName.toUpperCase()} ${order.type.amharicName}',
                                          )
                                        : Text(
                                            '${order.customerName.toUpperCase()} ${order.type.name.toUpperCase()}',
                                          ),
                                    content: amharic
                                        ? const Text('ትዕዛዙ ተጠናቋል?')
                                        : const Text('Is the order completed'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                            const Color(0xFFC5C2C2),
                                          ),
                                        ),
                                        child: amharic
                                            ? const Text('ሰርዝ')
                                            : const Text('Cancel'),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          _markAsCompleted();
                                          Navigator.pop(context);
                                          Navigator.pushNamed(
                                              context, '/home_screen');
                                        },
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    primaryColor)),
                                        child: amharic
                                            ? const Text('አዎ')
                                            : const Text('Yes'),
                                      ),
                                      const SizedBox(
                                        width: 11,
                                      ),
                                    ],
                                  );
                                });
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor)),
                          child: amharic
                              ? const Text('ተጠናቋል')
                              : const Text('Done'),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
