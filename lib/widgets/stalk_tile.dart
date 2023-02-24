import 'package:demakk_admin/objects/stalk.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

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
                      style: titleTextStyle,
                    )
                  : Text(
                      stalk.stalkType.typeName,
                      style: titleTextStyle,
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
