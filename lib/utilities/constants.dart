import 'package:flutter/material.dart';

import '../objects/color_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../objects/employee.dart';
import '../resources/employee_resource.dart';
import '../resources/wage_resource.dart';

const Color primaryColor = Color(0xFFFF6200);
const Color backgroundColor = Colors.white;

const ButtonStyle elevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(primaryColor),
);
//bool amharic = true;
//UserRole currentUserRole = employees[2].userRole;
Employee currentUser = employees[3];

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
  //unhide when other colors are needed
  // ColorObject(color: Colors.red, name: 'Red', amharicName: 'ቀይ'),
  // ColorObject(
  //     color: const Color(0xFFFF6200), name: 'Orange', amharicName: 'ብርትኳናማ'),
  // ColorObject(color: Colors.yellow, name: 'Yellow', amharicName: 'ቢጫ'),
];

// final List<Color> colorSelection = <Color>[
//   Colors.white,
//   Colors.black87,
//   Colors.red,
//   Color(0xFFFF6200),
//   Colors.yellow,
// ];
