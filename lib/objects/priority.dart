import 'package:demakk_admin/objects/priority_type.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:flutter/material.dart';

class Priority {
  PriorityType priorityType;
  late Color colorValue;
  Priority({required this.priorityType}) {
    if (priorityType.priorityLevel == 0) {
      colorValue = Colors.yellow;
    } else if (priorityType.priorityLevel == 1) {
      colorValue = Colors.green;
    } else if (priorityType.priorityLevel == 2) {
      colorValue = primaryColor;
    } else if (priorityType.priorityLevel == 3) {
      colorValue = Colors.redAccent;
    } else if (priorityType.priorityLevel == 4) {
      colorValue = const Color(0xFFF50000);
    }
  }
}
