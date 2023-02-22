import 'package:demakk_admin/objects/supplier.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

import '../objects/customer.dart';

class SupplierTile extends StatelessWidget {
  final Supplier supplier;
  final void Function() onPressed;
  const SupplierTile(
      {Key? key, required this.supplier, required this.onPressed})
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
                Text(
                  supplier.companyName,
                  style: titleTextStyle,
                ),
                const Divider(
                  color: primaryColor,
                  thickness: 2,
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Text(
                  supplier.phoneNumber,
                  style: subTitleTextStyle,
                ),
                Divider(
                  color: primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          supplier.address,
                          style: subTitleTextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
