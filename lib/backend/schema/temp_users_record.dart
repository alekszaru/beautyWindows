import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempUsersRecord extends FirestoreRecord {
  TempUsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "client_Phone_and_Name" field.
  String? _clientPhoneAndName;
  String get clientPhoneAndName => _clientPhoneAndName ?? '';
  bool hasClientPhoneAndName() => _clientPhoneAndName != null;

  // "mastersRefList" field.
  List<DocumentReference>? _mastersRefList;
  List<DocumentReference> get mastersRefList => _mastersRefList ?? const [];
  bool hasMastersRefList() => _mastersRefList != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _clientPhoneAndName = snapshotData['client_Phone_and_Name'] as String?;
    _mastersRefList = getDataList(snapshotData['mastersRefList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tempUsers');

  static Stream<TempUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TempUsersRecord.fromSnapshot(s));

  static Future<TempUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TempUsersRecord.fromSnapshot(s));

  static TempUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TempUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TempUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TempUsersRecord._(reference, mapFromFirestore(data));

  static TempUsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TempUsersRecord.getDocumentFromData(
        {
          'display_name': snapshot.data['display_name'],
          'uid': snapshot.data['uid'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'phone_number': snapshot.data['phone_number'],
          'client_Phone_and_Name': snapshot.data['client_Phone_and_Name'],
          'mastersRefList': safeGet(
            () => snapshot.data['mastersRefList'].map((s) => toRef(s)).toList(),
          ),
        },
        TempUsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TempUsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tempUsers',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TempUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TempUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTempUsersRecordData({
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? clientPhoneAndName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'client_Phone_and_Name': clientPhoneAndName,
    }.withoutNulls,
  );

  return firestoreData;
}

class TempUsersRecordDocumentEquality implements Equality<TempUsersRecord> {
  const TempUsersRecordDocumentEquality();

  @override
  bool equals(TempUsersRecord? e1, TempUsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.clientPhoneAndName == e2?.clientPhoneAndName &&
        listEquality.equals(e1?.mastersRefList, e2?.mastersRefList);
  }

  @override
  int hash(TempUsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.clientPhoneAndName,
        e?.mastersRefList
      ]);

  @override
  bool isValidKey(Object? o) => o is TempUsersRecord;
}
