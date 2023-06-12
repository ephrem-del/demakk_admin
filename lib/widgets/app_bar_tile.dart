import 'package:flutter/material.dart';

class AppBarTile extends StatelessWidget {
  final void Function() onTap;
  final IconData iconData;
  final String title;
  const AppBarTile(
      {Key? key,
      required this.onTap,
      required this.iconData,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        //splashColor: Colors.yellowAccent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Colors.white,
                size: 23,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
