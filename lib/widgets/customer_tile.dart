import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer;
  final void Function() onPressed;
  const CustomerTile(
      {Key? key, required this.customer, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      customer.name.toUpperCase(),
                      style: titleTextStyle,
                    ),
                    const Spacer(),
                    amharic
                        ? Text(
                            'ያልተከፈለ ሂሳብ: ',
                            style: subTitleTextStyle,
                          )
                        : Text(
                            'Payment Left: ',
                            style: subTitleTextStyle,
                          ),
                    Text(
                      customer.paymentLeft.toString(),
                      style: otherTextStyle,
                    )
                  ],
                ),
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    amharic
                        ? Text(
                            'ስልክ ቁጥር:',
                            style: subTitleTextStyle,
                          )
                        : Text(
                            'Phone No:',
                            style: subTitleTextStyle,
                          ),
                    const Spacer(),
                    Text(
                      customer.phoneNumber,
                      style: subTitleTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    amharic
                        ? Text(
                            'አድራሻ:',
                            style: subTitleTextStyle,
                          )
                        : Text(
                            'Address:',
                            style: subTitleTextStyle,
                          ),
                    const Spacer(),
                    Text(
                      customer.address,
                      style: subTitleTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
