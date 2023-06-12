import 'dart:core' as core;

import 'wage_resource.dart';

// core.List<Employee> employees = <Employee>[
//   Employee(
//       name: 'sami',
//       hourlyRate: 3.0,
//       rating: 3.3,
//       userRole: userRoles['officer']!),
//   Employee(
//       name: 'elias',
//       hourlyRate: 4.4,
//       rating: 3.3,
//       userRole: userRoles['labour']!),
//   Employee(
//       name: 'yidres',
//       hourlyRate: 5.5,
//       rating: 2.2,
//       userRole: userRoles['delivery']!),
//   Employee(
//       name: 'ephrem',
//       hourlyRate: 10.0,
//       rating: 4.5,
//       userRole: userRoles['admin']!),
// ];

core.List<Performance> performances = <Performance>[
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 1),
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 2),
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 3),
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 4),
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 5),
  Performance(month: '3,2023', ratedPerformance: 2.3, day: 6),
];

core.List<Rating> ratings = <Rating>[
  Rating(day: 1, month: '3,2023', rating: 4.5),
  Rating(day: 2, month: '3,2023', rating: 4.5),
  Rating(day: 3, month: '3,2023', rating: 4.5),
  Rating(day: 4, month: '3,2023', rating: 4.5),
  Rating(day: 5, month: '3,2023', rating: 4.5),
  Rating(day: 6, month: '3,2023', rating: 4.5),
];

core.List<TimeObject> times = <TimeObject>[
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
  TimeObject(timeRegistered: core.DateTime.now(), month: '3,2023', enter: true),
  TimeObject(
      timeRegistered: core.DateTime.now(), month: '3,2023', enter: false),
];

// core.List<UserRole> userRoles = [
//   UserRole(roleName: 'delivery'),
//   UserRole(roleName: 'sales'),
//   UserRole(roleName: 'admin'),
// ];

core.Map<core.String, UserRole> userRoles = {
  'delivery': UserRole(roleName: 'delivery'),
  'sales': UserRole(roleName: 'sales'),
  'admin': UserRole(roleName: 'admin'),
  'officer': UserRole(roleName: 'officer'),
  'labour': UserRole(roleName: 'labour'),
};
