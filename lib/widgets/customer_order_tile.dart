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
                      ? Text('ስም', style: subTitleTextStyle)
                      : Text(
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
                      ? Text('አይነት', style: subTitleTextStyle)
                      : Text(
                          'Type',
                          style: subTitleTextStyle,
                        ),
                  Spacer(),
                  Text(
                    '*****',
                    style: otherTextStyle,
                  )
                ],
              ),
              Row(
                children: [
                  amharic
                      ? Text('ብዛት', style: subTitleTextStyle)
                      : Text(
                          'Amount',
                          style: subTitleTextStyle,
                        ),
                  Spacer(),
                  Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? Text('የአንዱ ዋጋ', style: subTitleTextStyle)
                      : Text(
                          'Single Price',
                          style: subTitleTextStyle,
                        ),
                  Spacer(),
                  Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? Text('የተከፈለ', style: subTitleTextStyle)
                      : Text(
                          'Paid',
                          style: subTitleTextStyle,
                        ),
                  Spacer(),
                  Text(
                    '*****',
                    style: otherTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  amharic
                      ? Text(
                          'ቀሪ ሂሳብ',
                          style: subTitleTextStyle,
                        )
                      : Text(
                          'Payment Left',
                          style: subTitleTextStyle,
                        ),
                  Spacer(),
                  Text(
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
                        ? Text(
                            'የትዕዛዝ ቀን',
                            style: otherTextStyle,
                          )
                        : Text(
                            'Orders date',
                            style: otherTextStyle,
                          ),
                    Text('******')
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
