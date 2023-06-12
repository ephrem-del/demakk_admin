
import '../objects/employee.dart';

class EmployeeManagementScreenViewModel {
  EmployeeManagementScreenViewModel();

  DateTime todaysDate = DateTime.now()
      .subtract(
        Duration(
            hours: DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second),
      )
      .add(const Duration(hours: 8));

  registerTime(bool inOrNot, Employee employee) {
    // FirebaseFirestore.instance.collection('time controller').snapshots().listen((data) {
    // data.docs.map((doc) => )
    // });

    // FirebaseFirestore.instance.collection('time controller').add(data)
  }
}
