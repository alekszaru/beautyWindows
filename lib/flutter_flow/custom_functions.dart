import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool? hasNoChats(List<ChatsRecord>? allChats) {
  return allChats?.isEmpty ?? true;
}

DateTime? timeStampEndThisDay() {
  // get end this day
  var now = DateTime.now();
  return DateTime(now.year, now.month, now.day + 1, 0, 0, 0, 0, 0);
}

DateTimeRange? getTimeStampRangeForDayBefore(DateTimeRange? date) {
  // get Time Stamp Range For Day -1 TimeStamp argument
  final endDate = date!.start;
  final startDate = date.start.subtract(Duration(days: 1));

  return DateTimeRange(start: startDate, end: endDate);
}

DocumentReference? getCategoryRefFromName(String? catName) {
  var query;
  // get refference from category collection with catName field
  if (catName != null) {
    //query docs with a specific field
    query = FirebaseFirestore.instance
        .collection('category')
        .where('catName', isEqualTo: catName);
  }
  DocumentReference docRef = query.documents.elementAt(0);
  return docRef;
}

DateTimeRange? getDayMinusOne(DateTimeRange? day) {
  // get Day Minus One
  // get Time Stamp Range For Day -1 TimeStamp argument
  final endDate = day!.start;
  final startDate = day.start.subtract(Duration(days: 1));

  return DateTimeRange(start: startDate, end: endDate);
}

String? getUkrainianDate(String? dateDM) {
  // get ukrainian name of month and numeric day from string "Day/Month"
  if (dateDM != null) {
    var date = dateDM.split('/');
    var day = date[0];
    var month = date[1];
    var monthName = '';
    switch (month) {
      case '1':
        monthName = 'січня';
        break;
      case '2':
        monthName = 'лютого';
        break;
      case '3':
        monthName = 'березня';
        break;
      case '4':
        monthName = 'квітня';
        break;
      case '5':
        monthName = 'травня';
        break;
      case '6':
        monthName = 'червня';
        break;
      case '7':
        monthName = 'липня';
        break;
      case '8':
        monthName = 'серпня';
        break;
      case '9':
        monthName = 'вересня';
        break;
      case '10':
        monthName = 'жовтня';
        break;
      case '11':
        monthName = 'листопада';
        break;
      case '12':
        monthName = 'грудня';
        break;
    }
    return '$day $monthName';
  } else {
    return null;
  }
}

String getWordFromString(
  String string,
  int position,
) {
  return string.split(' ')[position - 1];
}

List<DocumentReference> getMastersWithClosestAppointments(String catName) {
  var query;
  // get refference from category collection with catName field
  if (catName != null) {
    //query docs with a specific field
    query = FirebaseFirestore.instance
        .collection('users')
        .where('favorite_categories', arrayContains: catName);
  }
  var docRefs = query.documents;
  return docRefs;
}
