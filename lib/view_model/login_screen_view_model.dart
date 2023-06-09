import 'package:demakk_admin/provider/employee_provider.dart';
import 'package:demakk_admin/resources/base_auth_user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../objects/employee.dart';

class LoginScreenViewModel {
  BuildContext context;
  DemakkEmployee? demakkEmployee;
  LoginScreenViewModel({required this.context});
  FirebaseAuth auth = FirebaseAuth.instance;
  // EmployeeProvider employeeProvider = EmployeeProvider();
  Future<bool> authenticateLogin(String email, String password) async {
    bool isLoggedIn = false;
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {
      isLoggedIn = true;
      DocumentSnapshot employeeDoc = await FirebaseFirestore.instance
          .collection('employees')
          .doc(email)
          .get();
      Employee employee = Employee.fromDocumentSnapshot(employeeDoc);
      demakkEmployee = DemakkEmployee(employee: employee);
      notifyProvider();
      // employeeProvider.employee = demakkEmployee;
      // employeeProvider.login(demakkEmployee);
    }
    return isLoggedIn;
  }

  notifyProvider() {
    context.read<EmployeeProvider>().login(demakkEmployee!);
  }
}
