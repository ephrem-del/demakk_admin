import '../objects/employee.dart';

abstract class BaseAuthUser {
  final Employee employee;
  BaseAuthUser({required this.employee});
  bool get loggedIn;
  // Employee get employee;
  String get employeeEmail => employee.employeeEmail;
  String get name => employee.name;
  String get positionTitle => employee.employeePosition.positionTitle;
  String get hourlyRate => employee.employeePosition.hourlyRate.toString();
  String get phoneNo => employee.phoneNo;
}

BaseAuthUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;

class DemakkEmployee extends BaseAuthUser {
  // final Employee employeeModel;
  DemakkEmployee({required super.employee});
  // @override
  // // TODO: implement employee
  // Employee get employee => throw UnimplementedError();

  @override
  // TODO: implement loggedIn
  bool get loggedIn => throw UnimplementedError();
}
