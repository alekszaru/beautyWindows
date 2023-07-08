import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MastersRecord extends FirestoreRecord {
  MastersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  DocumentReference? _uid;
  DocumentReference? get uid => _uid;
  bool hasUid() => _uid != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('masters');

  static Stream<MastersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MastersRecord.fromSnapshot(s));

  static Future<MastersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MastersRecord.fromSnapshot(s));

  static MastersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MastersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MastersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MastersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MastersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MastersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMastersRecordData({
  DocumentReference? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class MastersRecordDocumentEquality implements Equality<MastersRecord> {
  const MastersRecordDocumentEquality();

  @override
  bool equals(MastersRecord? e1, MastersRecord? e2) {
    return e1?.uid == e2?.uid;
  }

  @override
  int hash(MastersRecord? e) => const ListEquality().hash([e?.uid]);

  @override
  bool isValidKey(Object? o) => o is MastersRecord;
}
