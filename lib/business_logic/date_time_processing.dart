import 'dart:core';
import '../main.dart';

import '../utilities/constants.dart';

String convertWeekDay(DateTime dateTime) {
  if (dateTime.weekday == 1) {
    return amharic ? 'ሰኞ' : 'Monday';
  } else if (dateTime.weekday == 2) {
    return amharic ? 'ማክሰኞ' : 'Tuesday';
  } else if (dateTime.weekday == 3) {
    return amharic ? 'እሮብ' : 'Wednesday';
  } else if (dateTime.weekday == 4) {
    return amharic ? 'ሐሙስ' : 'Thursday';
  } else if (dateTime.weekday == 5) {
    return amharic ? 'አርብ' : 'Friday';
  } else if (dateTime.weekday == 6) {
    return amharic ? 'ቅዳሜ' : 'Saturday';
  } else {
    return amharic ? 'እሁድ' : 'Sunday';
  }
}

String convertMonth(DateTime dateTime) {
  if (dateTime.month == 1) {
    return amharic ? 'ጃንዋሪ' : 'January';
  } else if (dateTime.month == 2) {
    return amharic ? 'ፌብሩዋሪ' : 'February';
  } else if (dateTime.month == 3) {
    return amharic ? 'ማርች' : 'March';
  } else if (dateTime.month == 4) {
    return amharic ? 'ኤፕሪል' : 'April';
  } else if (dateTime.month == 5) {
    return amharic ? 'ሜይ' : 'May';
  } else if (dateTime.month == 6) {
    return amharic ? 'ጁን' : 'June';
  } else if (dateTime.month == 7) {
    return amharic ? 'ጁላይ' : 'July';
  } else if (dateTime.month == 8) {
    return amharic ? 'ኦገስት' : 'August';
  } else if (dateTime.month == 9) {
    return amharic ? 'ሴፕቴምበር' : 'September';
  } else if (dateTime.month == 10) {
    return amharic ? 'ኦክቶበር' : 'October';
  } else if (dateTime.month == 11) {
    return amharic ? 'ኖቪየምበር' : 'November';
  } else {
    return amharic ? 'ዲሴምበር' : 'December';
  }
}
