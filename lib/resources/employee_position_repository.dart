import 'package:demakk_admin/objects/employee_position.dart';


class EmployeePositionRepository{
  // final List<EmployeePosition> _employeePositions = <EmployeePosition>[
  //   EmployeePosition(positionTitle: 'Graphic Designer', hourlyRate: 30),
  //   EmployeePosition(positionTitle: 'Technical Support', hourlyRate: 15),
  // ];
  final Map<String, EmployeePosition> _employeePositions = <String, EmployeePosition>{
    'Graphic Designer': EmployeePosition(positionTitle: 'Graphic Designer', hourlyRate: 30),
    'Technical Support' : EmployeePosition(positionTitle: 'Technical Support', hourlyRate: 15),
  };
Map <String, EmployeePosition> get employeePositions => _employeePositions;
EmployeePosition get designer => _employeePositions['Graphic Designer']!;
EmployeePosition get support => _employeePositions['Technical Support']!;
}