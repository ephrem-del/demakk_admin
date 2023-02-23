import '../objects/customer.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class CustomerOrderTile extends StatelessWidget {
  final Customer customer;
  const CustomerOrderTile({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200,
      margin: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  amharic
                      ? const Text('ስም', style: subTitleTextStyle)
                      : const Text(
                          'Name',
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
                      ? const Text('አይነት', style: subTitleTextStyle)
                      : const Text(
                          'Type',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  const Text(
                    '*****',
                    style: otherTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('ብዛት', style: subTitleTextStyle)
                      : const Text(
                          'Amount',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  const Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('የአንዱ ዋጋ', style: subTitleTextStyle)
                      : const Text(
                          'Single Price',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  const Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text('የተከፈለ', style: subTitleTextStyle)
                      : const Text(
                          'Paid',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  const Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? const Text(
                          'ቀሪ ሂሳብ',
                          style: subTitleTextStyle,
                        )
                      : const Text(
                          'Payment Left',
                          style: subTitleTextStyle,
                        ),
                  const Spacer(),
                  const Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    amharic
                        ? const Text(
                            'የትዕዛዝ ቀን',
                            style: otherTextStyle,
                          )
                        : const Text(
                            'Orders date',
                            style: otherTextStyle,
                          ),
                    const Text('******')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
