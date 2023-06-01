import 'package:flutter/material.dart';
import '../objects/employee.dart';
import '../resources/employee_resource.dart';
import '../utilities/constants.dart';

import '../main.dart';
import 'drawer_component.dart';

class EmployeeManagementScreen extends StatefulWidget {
  const EmployeeManagementScreen({Key? key}) : super(key: key);

  @override
  State<EmployeeManagementScreen> createState() =>
      _EmployeeManagementScreenState();
}

class _EmployeeManagementScreenState extends State<EmployeeManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      appBar: AppBar(
        title: Text(amharic ? 'የሰራተኞች ማስተዳደርያ' : 'Employee Management'),
      ),
      body: bodyFunction(),
    );
  }
}

Widget bodyFunction() {
  if (currentUser.userRole.roleName == 'admin') {
    List<Widget> widgets = employees
        .map(
          (employee) => EmployeeTimeControllerWidget(employee: employee),
        )
        .toList();
    return Column(
      children: widgets,
    );
  } else {
    return EmployeeTimeControllerWidget(employee: currentUser);
  }
}

class EmployeeTimeControllerWidget extends StatelessWidget {
  final Employee employee;
  const EmployeeTimeControllerWidget({Key? key, required this.employee})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          employee.name,
          style: subTitleTextStyle,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('In'),
          style: elevatedButtonStyle,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Out'),
          style: elevatedButtonStyle,
        ),
      ],
    );
  }
}
