// import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/work_log_entry_screen_view_model.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/employee_provider.dart';
import '../resources/base_auth_user_provider.dart';

class WorkLogEntryScreen extends StatefulWidget {
  const WorkLogEntryScreen({super.key});

  @override
  State<WorkLogEntryScreen> createState() => _WorkLogEntryScreenState();
}

class _WorkLogEntryScreenState extends State<WorkLogEntryScreen> {
  late WorkLogEntryScreenViewModel _model;

  @override
  void initState() {
    _model = WorkLogEntryScreenViewModel();
    // _model.initState();
    // set();
    super.initState();
  }

  void _changeState() {
    _model.changeState();
    setState(() {});
  }

  set(BaseAuthUser currentUser) async {
    print(currentUser.employeeEmail);
    await _model.initState(currentUser);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    BaseAuthUser? currentUser = context.watch<EmployeeProvider>().currentUser;
    set(currentUser!);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser.name),
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TimeListWidget(
            time: _model.startMorningTime,
            text: 'Start Morning Time:',
          ),
          TimeListWidget(
              time: _model.startLunchTime, text: 'Start Lunch Break Time:'),
          TimeListWidget(
              time: _model.endLunchTime, text: 'End of Lunch Break Time:'),
          TimeListWidget(
              time: _model.endDayTime, text: 'End of days work Time:'),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: _changeState,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _model.color,
              ),
              child: Center(
                child: Text(
                  _model.buttonText,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeListWidget extends StatelessWidget {
  final String text;
  final String time;
  const TimeListWidget({super.key, required this.time, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
          ),
          Spacer(),
          Text(
            time,
          ),
        ],
      ),
    );
  }
}
