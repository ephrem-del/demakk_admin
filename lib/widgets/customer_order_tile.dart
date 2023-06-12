
import '../objects/customer.dart';
import 'package:flutter/material.dart';

import '../objects/order.dart';
import '../utilities/constants.dart';

import '../main.dart';

class CustomerOrderTile extends StatelessWidget {
  final Customer customer;
  final Order order;
  //double paymentLeft = 0;
  const CustomerOrderTile(
      {Key? key, required this.customer, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double paymentLeft = order.type.price * order.amount - order.paid;
    return Container(
      //height: 200,
      margin: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  amharic
                      ? const Text('ስም :', style: subTitleTextStyle)
                      : const Text(
                          'Name :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    customer.name,
                    style: otherTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('አይነት :', style: subTitleTextStyle)
                      : const Text(
                          'Type :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    amharic ? order.type.amharicName : order.type.name,
                    style: otherTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('ብዛት :', style: subTitleTextStyle)
                      : const Text(
                          'Amount :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    order.amount.toString(),
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('የአንዱ ዋጋ :', style: subTitleTextStyle)
                      : const Text(
                          'Single Price :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    order.type.price.toString(),
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('የተከፈለ :', style: subTitleTextStyle)
                      : const Text(
                          'Paid :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    order.paid.toString(),
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text(
                          'ቀሪ ሂሳብ :',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Payment Left :',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  Text(
                    paymentLeft.toString(),
                    style: otherTextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: primaryColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                    '${order.dateAndTime.month()} ${order.dateAndTime.day()} : ${order.dateAndTime.year()}',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        overflow: TextOverflow.fade,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
