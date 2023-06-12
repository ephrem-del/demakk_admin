import 'package:demakk_admin/objects/date_and_time.dart';
import 'package:demakk_admin/objects/work_log.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';

import '../objects/employee.dart';
import '../view_model/attendance_screen_view_model.dart';

class AttendanceScreen extends StatefulWidget {
  final Employee employee;
  const AttendanceScreen({super.key, required this.employee});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late AttendanceScreenViewModel attendanceScreenViewModel;
  @override
  Widget build(BuildContext context) {
    attendanceScreenViewModel = AttendanceScreenViewModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
              height: 50,
              width: double.infinity,
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 1, child: Center(child: Text('Date'))),
                    Expanded(flex: 1, child: Center(child: Text('Morn'))),
                    Expanded(flex: 1, child: Center(child: Text('Lunch'))),
                    Expanded(flex: 1, child: Center(child: Text('Lunch'))),
                    Expanded(flex: 1, child: Center(child: Text('EOD'))),
                  ])),
          const Divider(
            color: primaryColor,
            thickness: 2.0,
          ),
          Expanded(
            child: FirestoreListView<Map<String, dynamic>>(
                query: attendanceScreenViewModel.getAttendance(widget.employee),
                itemBuilder: (context, snapshot) {
                  // Map<String, dynamic> attendanceEntries = snapshot;
                  WorkLog workLog = WorkLog.fromDocSnapshot(snapshot);
                  return AttendanceDisplayWidget(
                    workLog: workLog,
                  );
                }),
          )
        ]),
      ),
    );
  }
}

class AttendanceDisplayWidget extends StatelessWidget {
  final WorkLog workLog;
  const AttendanceDisplayWidget({super.key, required this.workLog});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    DateAndTime(dateTime: workLog.startMorning).date(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    DateAndTime(dateTime: workLog.startMorning).time(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    DateAndTime(dateTime: workLog.startLunch).time(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    DateAndTime(dateTime: workLog.endLunch).time(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    DateAndTime(dateTime: workLog.endDay).time(),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: primaryColor,thickness: 1.0,),
      ],
    );
  }
}
