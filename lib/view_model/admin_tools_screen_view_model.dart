import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demakk_admin/objects/employee.dart';

class AdminToolsScreenViewModel {
  AdminToolsScreenViewModel();
  Future<List<Employee>> getEmployees() async {
    QuerySnapshot employeesDocument =
        await FirebaseFirestore.instance.collection('employees').get();
    List<Employee> employees = employeesDocument.docs
        .map((doc) => Employee.fromDocumentSnapshot(doc))
        .toList();
    return employees;
  }
}
