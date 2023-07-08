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

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "clientPhone" field.
  String? _clientPhone;
  String get clientPhone => _clientPhone ?? '';
  bool hasClientPhone() => _clientPhone != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

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

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _clientName = snapshotData['clientName'] as String?;
    _clientPhone = snapshotData['clientPhone'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _clientPhoneAndName = snapshotData['client_Phone_and_Name'] as String?;
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
          'owner': safeGet(
            () => toRef(snapshot.data['owner']),
          ),
          'clientName': snapshot.data['clientName'],
          'clientPhone': snapshot.data['clientPhone'],
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'phone_number': snapshot.data['phone_number'],
          'client_Phone_and_Name': snapshot.data['client_Phone_and_Name'],
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
  DocumentReference? owner,
  String? clientName,
  String? clientPhone,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? clientPhoneAndName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'clientName': clientName,
      'clientPhone': clientPhone,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
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
    return e1?.owner == e2?.owner &&
        e1?.clientName == e2?.clientName &&
        e1?.clientPhone == e2?.clientPhone &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.clientPhoneAndName == e2?.clientPhoneAndName;
  }

  @override
  int hash(TempUsersRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.clientName,
        e?.clientPhone,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.clientPhoneAndName
      ]);

  @override
  bool isValidKey(Object? o) => o is TempUsersRecord;
}
