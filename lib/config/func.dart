import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatTimestamp(Timestamp timestamp) {
  DateTime date = timestamp.toDate();
  DateFormat formatter = DateFormat('dd MMM yyyy');
  return formatter.format(date);
}
