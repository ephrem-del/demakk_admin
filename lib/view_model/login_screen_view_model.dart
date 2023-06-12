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
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      isLoggedIn = true;
      DocumentSnapshot employeeDoc = await FirebaseFirestore.instance
          .collection('employees')
          .doc(email)
          .get();
      Employee employee = Employee.fromDocumentSnapshot(employeeDoc);
      demakkEmployee = DemakkEmployee(employee: employee);
      // context.read<EmployeeProvider>().login(demakkEmployee as BaseAuthUser);
      // currentUser =
      notifyProvider();
    } on FirebaseAuthException catch (e) {
      print('firebase auth error: $e');
    } on FirebaseException catch (e) {
      print('firebase error: $e');
    } catch (e) {
      print(e);
    }

    return isLoggedIn;
  }

  logout() async {
    auth.signOut();
    context.read<EmployeeProvider>().logout();
  }

  notifyProvider() {
    context.read<EmployeeProvider>().login(demakkEmployee!);
  }
}
