import 'package:cloud_firestore/cloud_firestore.dart';

class Performance {
  int day;
  String month;
  double ratedPerformance;

  int todayDay = DateTime.now().month;
  String calculationMonth = '${DateTime.now().month}, ${DateTime.now().year}';

  Performance(
      {required this.month, required this.ratedPerformance, required this.day});

  Map<String, dynamic> toMap() {
    return {
      '$todayDay': ratedPerformance,
      'month': calculationMonth,
    };
  }

  factory Performance.fromSnapshot(QueryDocumentSnapshot doc, int day) {
    return Performance(
        month: doc['month'], ratedPerformance: doc[day], day: day);
  }
}

class Rating {
  int day;
  String month;
  double rating;

  int todayDay = DateTime.now().month;
  String calculationMonth = '${DateTime.now().month}, ${DateTime.now().year}';

  Rating({required this.day, required this.month, required this.rating});

  Map<String, dynamic> toMap() {
    return {
      '$todayDay': rating,
      'month': calculationMonth,
    };
  }

  factory Rating.fromSnapshot(QueryDocumentSnapshot doc, int day) {
    return Rating(day: day, month: doc['month'], rating: doc[day]);
  }
}

class TimeObject {
  DateTime timeRegistered;
  String month;
  bool enter;

  int todayDay = DateTime.now().month;
  //String calculationMonth = '${DateTime.now().month}, ${DateTime.now().year}';

  TimeObject(
      {required this.timeRegistered, required this.month, required this.enter});

  Map<String, dynamic> toMap(bool enter) {
    if (enter) {
      return {'enter $todayDay': timeRegistered};
    } else {
      return {'exit $todayDay': timeRegistered};
    }
  }

  factory TimeObject.fromSnapshot(
      QueryDocumentSnapshot doc, int day, bool enter) {
    return TimeObject(
        timeRegistered: enter ? doc['enter $day'] : doc['exit $day'],
        month: doc['month'],
        enter: enter);
  }
}

class UserRole {
  String roleName;
  UserRole({required this.roleName});
}
