import 'package:cloud_firestore/cloud_firestore.dart';

import '../utilities/convert_timestamp_to_datetime.dart';

class WorkLog {
  final String employeeEmail;
  final DateTime? startMorning;
  final DateTime? startLunch;
  final DateTime? endLunch;
  final DateTime? endDay;
  WorkLog(
      {this.startMorning,
      this.startLunch,
      this.endLunch,
      this.endDay,
      required this.employeeEmail});

  factory WorkLog.fromSnapshot(QueryDocumentSnapshot snapshot) {
    return WorkLog(
      employeeEmail: snapshot['employeeId'],
      startMorning: snapshot['startMorning'],
      startLunch: snapshot['startLunch'],
      endLunch: snapshot['endLunch'],
      endDay: snapshot['endDay'],
    );
  }

  factory WorkLog.fromDocSnapshot(DocumentSnapshot snapshot) {
    return WorkLog(
      employeeEmail: snapshot['employeeId'],
      startMorning: convertTimeStampToDateTime(snapshot['startMorning']),
      startLunch: convertTimeStampToDateTime(snapshot['startLunch']),
      endLunch: convertTimeStampToDateTime(snapshot['endLunch']),
      endDay: convertTimeStampToDateTime(snapshot['endDay']),
    );
  }

  toMap() {
    return {
      'employeeId': employeeEmail,
      'startMorning': startMorning,
      'startLunch': startLunch,
      'endLunch': endLunch,
      'endDay': endDay,
    };
  }
}
