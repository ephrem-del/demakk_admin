import 'package:demakk_admin/utilities/constants.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import '../objects/customer.dart';
import '../objects/order.dart';
import '../screens/order_detail_screen.dart';

import '../main.dart';

class OrderTile extends StatelessWidget {
  //final Customer customer;
  final Order order;
  const OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Stack(alignment: Alignment.topRight, children: [
        Card(
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(15),
            //height: 190,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: amharic
                      ? Text(
                          order.type.amharicName,
                          textAlign: TextAlign.center,
                          //maxLines: 1,
                          overflow: TextOverflow.fade,
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
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(amharic ? 'አስቸኳይነት:' : 'Priority:'),
            const SizedBox(
              width: 5,
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              width: 100,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: order.priority.colorValue,
              ),
              child: Center(
                child: amharic
                    ? Text(order.priority.priorityType.amharicName)
                    : Text(order.priority.priorityType.name),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
