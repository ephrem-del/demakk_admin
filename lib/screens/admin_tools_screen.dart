import 'package:demakk_admin/screens/attendance_screen.dart';
import 'package:demakk_admin/utilities/constants.dart';
import 'package:demakk_admin/view_model/admin_tools_screen_view_model.dart';
import 'package:flutter/material.dart';

import '../objects/employee.dart';

class AdminToolsScreen extends StatefulWidget {
  const AdminToolsScreen({super.key});

  @override
  State<AdminToolsScreen> createState() => _AdminToolsScreenState();
}

class _AdminToolsScreenState extends State<AdminToolsScreen> {
  late AdminToolsScreenViewModel adminToolsScreenViewModel =
      AdminToolsScreenViewModel();
  List<Employee> employees = [];

  @override
  initState() {
    getEmployees();
    super.initState();
  }

  getEmployees() async {
    print('get employees called');
    final List<Employee> _employees =
        await adminToolsScreenViewModel.getEmployees();
    print('getting employees finished');
    setState(() {});
    employees = _employees;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text('Admin Tools'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            topLeft: Radius.circular(4),
                          ),
                        ),
                        child: const Center(child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text('Attendance', style: subTitleTextStyle,),
                        )),
                      ),
                      SizedBox(
                        height: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: GridView.builder(
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3 / 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                            itemCount: employees.length,
                            itemBuilder: (context, i) {
                              Employee employee = employees[i];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => AttendanceScreen(
                                              employee: employee),),);
                                },
                                child: Card(
                                  color: primaryColor,
                                  child: Center(
                                    child: Text(
                                      employee.name,
                                      style: TextStyle(
                                        fontSize: subTitleTextStyle.fontSize,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
