// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> getAppointmentsFromPrevDay(DateTime currentDay) async {
  final CollectionReference appointmentsCollection =
      FirebaseFirestore.instance.collection('appointments');

  DateTime previousDay =
      currentDay.subtract(Duration(days: 1)); // поточний день мінус один день
  final QuerySnapshot appointmentsSnapshot = await appointmentsCollection
      .where('time_start',
          isGreaterThanOrEqualTo: Timestamp.fromDate(previousDay))
      .where('time_start', isLessThan: currentDay)
      .get();

  final List<QueryDocumentSnapshot> documents = appointmentsSnapshot.docs;

  for (final doc in documents) {
    final DateTime previousTime = (doc['time_start'] as Timestamp).toDate();
    final DateTime currentTime = previousTime.add(Duration(days: 1));
    await FirebaseFirestore.instance.collection('appointments').add({
      'time_start': Timestamp.fromDate(currentTime),
      'masterREF': doc['masterREF'],
      'isActive': true,
      'withTempUser': false,
    });
  }
  return "Ok";
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
