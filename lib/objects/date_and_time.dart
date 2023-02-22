import 'dart:core' as core;

import 'package:demakk_admin/business_logic/date_time_processing.dart';

class DateAndTime {
  final core.DateTime dateTime;

  DateAndTime({required this.dateTime});

  core.String day() {
    core.String day = convertWeekDay(dateTime);
    return day;
  }

  core.String year() {
    core.String year = dateTime.year.toString();
    return year;
  }

  core.String month() {
    core.String month = convertMonth(dateTime);
    return month;
  }

  core.String hour() {
    core.String hour = dateTime.hour.toString();
    if (hour.length == 1) {
      hour = '0$hour';
    }
    return hour;
  }

  core.String minute() {
    core.String minute = dateTime.minute.toString();
    if (minute.length == 1) {
      minute = '0$minute';
    }
    return minute;
  }

  core.String second() {
    core.String second = dateTime.second.toString();
    if (second.length == 1) {
      second = '0$second';
    }
    return second;
  }
}
