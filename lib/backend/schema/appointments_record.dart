import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentsRecord extends FirestoreRecord {
  AppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_start" field.
  DateTime? _timeStart;
  DateTime? get timeStart => _timeStart;
  bool hasTimeStart() => _timeStart != null;

  // "duration_in_minutes" field.
  int? _durationInMinutes;
  int get durationInMinutes => _durationInMinutes ?? 0;
  bool hasDurationInMinutes() => _durationInMinutes != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "isFinished" field.
  bool? _isFinished;
  bool get isFinished => _isFinished ?? false;
  bool hasIsFinished() => _isFinished != null;

  // "servicesREFList" field.
  List<DocumentReference>? _servicesREFList;
  List<DocumentReference> get servicesREFList => _servicesREFList ?? const [];
  bool hasServicesREFList() => _servicesREFList != null;

  // "masterREF" field.
  DocumentReference? _masterREF;
  DocumentReference? get masterREF => _masterREF;
  bool hasMasterREF() => _masterREF != null;

  // "clientREF" field.
  DocumentReference? _clientREF;
  DocumentReference? get clientREF => _clientREF;
  bool hasClientREF() => _clientREF != null;

  // "isCanceled" field.
  bool? _isCanceled;
  bool get isCanceled => _isCanceled ?? false;
  bool hasIsCanceled() => _isCanceled != null;

  // "withTempUser" field.
  bool? _withTempUser;
  bool get withTempUser => _withTempUser ?? false;
  bool hasWithTempUser() => _withTempUser != null;

  // "tempUserREF" field.
  DocumentReference? _tempUserREF;
  DocumentReference? get tempUserREF => _tempUserREF;
  bool hasTempUserREF() => _tempUserREF != null;

  // "categoriesNameList" field.
  List<String>? _categoriesNameList;
  List<String> get categoriesNameList => _categoriesNameList ?? const [];
  bool hasCategoriesNameList() => _categoriesNameList != null;

  // "photoResults" field.
  List<String>? _photoResults;
  List<String> get photoResults => _photoResults ?? const [];
  bool hasPhotoResults() => _photoResults != null;

  // "tempUserContacts" field.
  String? _tempUserContacts;
  String get tempUserContacts => _tempUserContacts ?? '';
  bool hasTempUserContacts() => _tempUserContacts != null;

  void _initializeFields() {
    _timeStart = snapshotData['time_start'] as DateTime?;
    _durationInMinutes = castToType<int>(snapshotData['duration_in_minutes']);
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _isActive = snapshotData['isActive'] as bool?;
    _isFinished = snapshotData['isFinished'] as bool?;
    _servicesREFList = getDataList(snapshotData['servicesREFList']);
    _masterREF = snapshotData['masterREF'] as DocumentReference?;
    _clientREF = snapshotData['clientREF'] as DocumentReference?;
    _isCanceled = snapshotData['isCanceled'] as bool?;
    _withTempUser = snapshotData['withTempUser'] as bool?;
    _tempUserREF = snapshotData['tempUserREF'] as DocumentReference?;
    _categoriesNameList = getDataList(snapshotData['categoriesNameList']);
    _photoResults = getDataList(snapshotData['photoResults']);
    _tempUserContacts = snapshotData['tempUserContacts'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointments');

  static Stream<AppointmentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsRecord.fromSnapshot(s));

  static Future<AppointmentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentsRecord.fromSnapshot(s));

  static AppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsRecordData({
  DateTime? timeStart,
  int? durationInMinutes,
  double? totalPrice,
  bool? isActive,
  bool? isFinished,
  DocumentReference? masterREF,
  DocumentReference? clientREF,
  bool? isCanceled,
  bool? withTempUser,
  DocumentReference? tempUserREF,
  String? tempUserContacts,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_start': timeStart,
      'duration_in_minutes': durationInMinutes,
      'total_price': totalPrice,
      'isActive': isActive,
      'isFinished': isFinished,
      'masterREF': masterREF,
      'clientREF': clientREF,
      'isCanceled': isCanceled,
      'withTempUser': withTempUser,
      'tempUserREF': tempUserREF,
      'tempUserContacts': tempUserContacts,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsRecordDocumentEquality
    implements Equality<AppointmentsRecord> {
  const AppointmentsRecordDocumentEquality();

  @override
  bool equals(AppointmentsRecord? e1, AppointmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStart == e2?.timeStart &&
        e1?.durationInMinutes == e2?.durationInMinutes &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.isActive == e2?.isActive &&
        e1?.isFinished == e2?.isFinished &&
        listEquality.equals(e1?.servicesREFList, e2?.servicesREFList) &&
        e1?.masterREF == e2?.masterREF &&
        e1?.clientREF == e2?.clientREF &&
        e1?.isCanceled == e2?.isCanceled &&
        e1?.withTempUser == e2?.withTempUser &&
        e1?.tempUserREF == e2?.tempUserREF &&
        listEquality.equals(e1?.categoriesNameList, e2?.categoriesNameList) &&
        listEquality.equals(e1?.photoResults, e2?.photoResults) &&
        e1?.tempUserContacts == e2?.tempUserContacts;
  }

  @override
  int hash(AppointmentsRecord? e) => const ListEquality().hash([
        e?.timeStart,
        e?.durationInMinutes,
        e?.totalPrice,
        e?.isActive,
        e?.isFinished,
        e?.servicesREFList,
        e?.masterREF,
        e?.clientREF,
        e?.isCanceled,
        e?.withTempUser,
        e?.tempUserREF,
        e?.categoriesNameList,
        e?.photoResults,
        e?.tempUserContacts
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsRecord;
}
