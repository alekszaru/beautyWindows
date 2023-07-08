import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "notification" field.
  String? _notification;
  String get notification => _notification ?? '';
  bool hasNotification() => _notification != null;

  // "isNew" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "appREF" field.
  DocumentReference? _appREF;
  DocumentReference? get appREF => _appREF;
  bool hasAppREF() => _appREF != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _notification = snapshotData['notification'] as String?;
    _isNew = snapshotData['isNew'] as bool?;
    _time = snapshotData['time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _link = snapshotData['link'] as String?;
    _appREF = snapshotData['appREF'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  DocumentReference? userRef,
  String? notification,
  bool? isNew,
  DateTime? time,
  String? type,
  String? link,
  DocumentReference? appREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'notification': notification,
      'isNew': isNew,
      'time': time,
      'type': type,
      'link': link,
      'appREF': appREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.notification == e2?.notification &&
        e1?.isNew == e2?.isNew &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.link == e2?.link &&
        e1?.appREF == e2?.appREF;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.notification,
        e?.isNew,
        e?.time,
        e?.type,
        e?.link,
        e?.appREF
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
