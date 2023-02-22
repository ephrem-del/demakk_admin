import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class StalkCategoryTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const StalkCategoryTile(
      {Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          elevation: 5.0,
          child: Center(
            child: Text(
              title,
              style: titleTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
