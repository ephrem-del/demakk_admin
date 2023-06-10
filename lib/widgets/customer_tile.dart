import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';
import '../main.dart';

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
                        ? const Text(
                            'ያልተከፈለ ሂሳብ: ',
                            style: subTitleTextStyle,
                          )
                        : const Text(
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
                        ? const Text(
                            'ስልክ ቁጥር:',
                            style: subTitleTextStyle,
                          )
                        : const Text(
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
                        ? const Text(
                            'አድራሻ:',
                            style: subTitleTextStyle,
                          )
                        : const Text(
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
