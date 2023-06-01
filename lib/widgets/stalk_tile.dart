import 'package:demakk_admin/objects/stalk.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../main.dart';

class StalkTile extends StatelessWidget {
  final Stalk stalk;
  const StalkTile({Key? key, required this.stalk}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: <Widget>[
              amharic
                  ? Text(
                      stalk.stalkType.amharicTypeName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        overflow: TextOverflow.fade,
                      ),
                    )
                  : Text(
                      stalk.stalkType.typeName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                        overflow: TextOverflow.fade,
                      ),
                    ),
              const Spacer(),
              Text(
                stalk.amountLeft.toString(),
                style: subTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
