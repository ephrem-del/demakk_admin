import 'package:flutter/material.dart';

import '../objects/color_object.dart';

const Color primaryColor = Color(0xFFFF6200);
const Color backgroundColor = Colors.white;
bool amharic = true;

const TextStyle titleTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
  color: primaryColor,
  overflow: TextOverflow.fade,
);
const TextStyle subTitleTextStyle = TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.w600, overflow: TextOverflow.fade);
const TextStyle otherTextStyle = TextStyle(
    fontWeight: FontWeight.normal, fontSize: 15.0, overflow: TextOverflow.fade);

//InputDecoration userInputDecoration =

InputDecoration userInputDecoration(
  String type,
  Icon icon,
) {
  return InputDecoration(
    prefixIconColor: primaryColor,
    prefixIcon: icon,
    hintText: type,
    fillColor: primaryColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}

final List<int> amount = List<int>.generate(499, (index) => index + 1);

final List<String> tshirtSizes = <String>[
  //'S',
  'M',
  'L',
  'XL',
  'XXL',
];

final List<ColorObject> colorSelection = <ColorObject>[
  ColorObject(color: Colors.white, name: 'White', amharicName: 'ነጭ'),
  ColorObject(color: Colors.black87, name: 'Black', amharicName: 'ጥቁር'),
  ColorObject(color: Colors.red, name: 'Red', amharicName: 'ቀይ'),
  ColorObject(
      color: const Color(0xFFFF6200), name: 'Orange', amharicName: 'ብርትኳናማ'),
  ColorObject(color: Colors.yellow, name: 'Yellow', amharicName: 'ቢጫ'),
];

// final List<Color> colorSelection = <Color>[
//   Colors.white,
//   Colors.black87,
//   Colors.red,
//   Color(0xFFFF6200),
//   Colors.yellow,
// ];
