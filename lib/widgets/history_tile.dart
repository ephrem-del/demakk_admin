import 'package:demakk_admin/utilities/constants.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../objects/customer.dart';
import '../objects/order.dart';
import '../screens/order_detail_screen.dart';

import '../main.dart';

class HistoryTile extends StatelessWidget {
  //final Customer customer;
  final Order order;
  const HistoryTile({
    Key? key,
    required this.order,
    //required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${order.dateAndTime.month()}, ${order.dateAndTime.day()} ${order.dateAndTime.hour()}:${order.dateAndTime.minute()}',
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: amharic
                        ? Text(
                            order.type.amharicName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4.0,
                            ),
                          )
                        : Text(
                            order.type.name.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4.0,
                            ),
                          ),
                  ),
                  const Divider(
                    color: primaryColor,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      amharic
                          ? const Text(
                              'ስም :',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          : const Text(
                              'Name :',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          order.customerName.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      amharic
                          ? const Text(
                              'ዋጋ',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          : const Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                      const SizedBox(
                        width: 36.0,
                      ),
                      Text(
                        order.type.price.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return OrderDetailScreen(
                              order: order,
                              // customer: customer,
                            );
                          }));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                        ),
                        child: const Icon(Icons.arrow_forward),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
