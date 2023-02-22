import 'dart:core';

String convertWeekDay(DateTime dateTime) {
  if (dateTime.weekday == 1) {
    return 'Monday';
  } else if (dateTime.weekday == 2) {
    return 'Tuesday';
  } else if (dateTime.weekday == 3) {
    return 'Wednesday';
  } else if (dateTime.weekday == 4) {
    return 'Thursday';
  } else if (dateTime.weekday == 5) {
    return 'Friday';
  } else if (dateTime.weekday == 6) {
    return 'Saturday';
  } else {
    return 'Sunday';
  }
}

String convertMonth(DateTime dateTime) {
  if (dateTime.month == 1) {
    return 'January';
  } else if (dateTime.month == 2) {
    return 'February';
  } else if (dateTime.month == 3) {
    return 'March';
  } else if (dateTime.month == 4) {
    return 'April';
  } else if (dateTime.month == 5) {
    return 'May';
  } else if (dateTime.month == 6) {
    return 'June';
  } else if (dateTime.month == 7) {
    return 'July';
  } else if (dateTime.month == 8) {
    return 'August';
  } else if (dateTime.month == 9) {
    return 'September';
  } else if (dateTime.month == 10) {
    return 'October';
  } else if (dateTime.month == 11) {
    return 'November';
  } else {
    return 'December';
  }
}
