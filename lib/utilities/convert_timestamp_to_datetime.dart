import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

DateTime convertTimeStampToDateTime(Timestamp timestamp) {
  return timestamp.toDate();
}
