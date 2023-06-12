import 'dart:core' as core;

import 'package:demakk_admin/business_logic/date_time_processing.dart';

class DateAndTime {
  final core.DateTime? dateTime;

  DateAndTime({required this.dateTime});

  core.String date() {
    if (dateTime == null) {
      return '';
    }
    core.String date = dateTime!.day.toString();
    core.String year = dateTime!.year.toString();
    core.String month = dateTime!.month.toString();

    return '$date,$month,$year';
  }

  core.String day() {
    if (dateTime == null) {
      return '';
    }
    core.String day = convertWeekDay(dateTime!);
    core.String date = dateTime!.day.toString();
    return '$date, $day';
  }

  core.String year() {
    if (dateTime == null) {
      return '';
    }
    core.String year = dateTime!.year.toString();
    return year;
  }

  core.String month() {
    if (dateTime == null) {
      return '';
    }
    core.String month = convertMonth(dateTime!);
    return month;
  }

  core.String time() {
    if (dateTime == null) {
      return '';
    }
    core.String _hour = dateTime!.hour.toString();
    if (_hour.length == 1) {
      _hour = '0$_hour';
    }

    core.String _minute = dateTime!.minute.toString();
    if (_minute.length == 1) {
      _minute = '0$_minute';
    }

    core.String time = '$_hour:$_minute';
    return time;
  }

  core.String hour() {
    if (dateTime == null) {
      return '';
    }
    core.String hour = dateTime!.hour.toString();
    if (hour.length == 1) {
      hour = '0$hour';
    }
    return hour;
  }

  core.String minute() {
    if (dateTime == null) {
      return '';
    }
    core.String minute = dateTime!.minute.toString();
    if (minute.length == 1) {
      minute = '0$minute';
    }
    return minute;
  }

  core.String second() {
    if (dateTime == null) {
      return '';
    }
    core.String second = dateTime!.second.toString();
    if (second.length == 1) {
      second = '0$second';
    }
    return second;
  }
}
