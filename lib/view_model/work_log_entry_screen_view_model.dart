import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../objects/work_log.dart';
import '../resources/base_auth_user_provider.dart';

class WorkLogEntryScreenViewModel {
  final DateTime dateTime = DateTime.now();
  // late final Employee employee;
  bool _startedMorning = false;
  bool _startLunch = false;
  bool _endLunch = false;
  bool _endDay = false;
  DateTime? _startMorningTime;
  DateTime? _startLunchTime;
  DateTime? _endLunchTime;
  DateTime? _endDayTime;
  BaseAuthUser? _currentUser;
  WorkLogEntryScreenViewModel() {
    // employee = currentUser;
    // _getWorkLogEntry();
  }

  Future<void> initState(BaseAuthUser currentUser) async {
    // bool check = await _checkIfWorkLogExists();
    _currentUser = currentUser;

    await _getWorkLogEntry();
  }

  String _getDocumentId() {
    print('_getDocumentId called');
    return '${dateTime.day},${dateTime.month},${dateTime.year}';
  }

  //sm means startMorning
  //sl means startLunch
  //el menas endLunch
  //ot means overTime

  _addWorkLogEntry() async {
    print('_addWorkLogEntry called');
    try {
      await FirebaseFirestore.instance
          .collection('employees')
          .doc(_currentUser!.employeeEmail)
          .collection('time controller')
          .doc(_getDocumentId())
          .set(WorkLog(
            employeeEmail: _currentUser!.employeeEmail,
            startMorning: _startMorningTime,
            startLunch: _startLunchTime,
            endLunch: _endLunchTime,
            endDay: _endDayTime,
          ).toMap());
    } on FirebaseException catch (e) {
      print('firebase exception: $e');
    } catch (e) {
      print('error: $e');
    }
  }

  Future<bool> _checkIfWorkLogExists() async {
    print('_checkIfWorkLogExists called');
    FirebaseFirestore.instance
        .collection('employees')
        .doc(_currentUser?.employeeEmail)
        .collection('time controller')
        .doc(_getDocumentId())
        .get()
        .then((DocumentSnapshot snapshot) {
      if (snapshot.exists) {
        print('check... true');
        return true;
      }
      return false;
    });
    return false;
  }

  Future<void> _getWorkLogEntry() async {
    print('_getWorkLogEntry called');
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('employees')
        .doc(_currentUser!.employeeEmail)
        .collection('time controller')
        .doc(_getDocumentId())
        .get();
    WorkLog _log =
        !doc.exists ? WorkLog(employeeEmail: '') : WorkLog.fromDocSnapshot(doc);

    if (_log.endDay != null || _log.endDay.toString() != 'null') {
      _startMorningTime = _log.startMorning;
      _startLunchTime = _log.startLunch;
      _endLunchTime = _log.endLunch;
      _endDayTime = _log.endDay;
      _startedMorning = true;
      _startLunch = true;
      _endLunch = true;
      _endDay = true;
      return;
    } else if (_log.endLunch != null || _log.endLunch.toString() != 'null') {
      _startMorningTime = _log.startMorning;
      _startLunchTime = _log.startLunch;
      _endLunchTime = _log.endLunch;
      _startedMorning = true;
      _startLunch = true;
      _endLunch = true;
      return;
    } else if (_log.startLunch != null ||
        _log.startLunch.toString() != 'null') {
      _startMorningTime = _log.startMorning;
      _startLunchTime = _log.startLunch;
      _startedMorning = true;
      _startLunch = true;
      return;
    } else if (_log.startMorning != null ||
        _log.startMorning.toString() != 'null') {
      _startMorningTime = _log.startMorning;
      _startedMorning = true;
      return;
    }
  }

  Color get color {
    if (_endDay) {
      return Colors.red;
    } else if (_endLunch) {
      return Colors.orange;
    } else if (_startLunch) {
      return Colors.green;
    } else if (_startedMorning) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  String get buttonText {
    if (_endDay) {
      return 'Finished Work';
    } else if (_endLunch) {
      return 'Finished';
    } else if (_startLunch) {
      return 'End Lunch break';
    } else if (_startedMorning) {
      return 'Start Lunch break';
    } else {
      return 'Start day';
    }
  }

  String get startMorningTime => _startMorningTime.toString();
  String get startLunchTime => _startLunchTime.toString();
  String get endLunchTime => _endLunchTime.toString();
  String get endDayTime => _endDayTime.toString();

  changeState() {
    print('changeState called');
    if (!_startedMorning) {
      _startedMorning = true;
      _startMorningTime = DateTime.now();
      _addWorkLogEntry();
    } else if (!_startLunch) {
      _startLunch = true;
      _startLunchTime = DateTime.now();
      _addWorkLogEntry();
    } else if (!_endLunch) {
      _endLunch = true;
      _endLunchTime = DateTime.now();
      _addWorkLogEntry();
    } else if (!_endDay) {
      _endDay = true;
      _endDayTime = DateTime.now();
      _addWorkLogEntry();
    }
  }
}
