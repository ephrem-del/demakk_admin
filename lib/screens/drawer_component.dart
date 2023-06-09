import 'package:demakk_admin/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utilities/constants.dart';
import '../widgets/app_bar_tile.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmployeeProvider employeeProvider = Provider.of<EmployeeProvider>(context, listen: false);
    print('employee name: ${employeeProvider.currentUser}');
    return Drawer(
      backgroundColor: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      'images/demakk_logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  radius: 60.0,
                ),
                SizedBox(
                  width: 10,
                ),
                
                Text('${context.watch<EmployeeProvider>().currentUser?.name}',style: TextStyle(fontSize: 20, color: Colors.white),),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              color: Colors.white,
              thickness: 1.0,
            ),
            SizedBox(
              height: 15,
            ),
            AppBarTile(
                onTap: () {
                  Navigator.pushNamed(context, '/home_screen');
                },
                iconData: Icons.home,
                title: 'Home'),
            AppBarTile(
              onTap: () {},
              iconData: Icons.admin_panel_settings,
              title: 'Admin Tools',
            ),
            AppBarTile(
              onTap: () {
                Navigator.pushNamed(context, 'work_log_entry_screen');
              },
              iconData: Icons.person_2,
              title: 'Employee Management',
            ),
            AppBarTile(
              onTap: () {},
              iconData: Icons.money,
              title: 'Finance',
            ),
            AppBarTile(
                onTap: () {
                  Navigator.pushNamed(context, 'settings_screen');
                },
                iconData: Icons.settings,
                title: 'Settings'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black87),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
