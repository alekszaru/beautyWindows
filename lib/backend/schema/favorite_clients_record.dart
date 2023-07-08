import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteClientsRecord extends FirestoreRecord {
  FavoriteClientsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userREF" field.
  DocumentReference? _userREF;
  DocumentReference? get userREF => _userREF;
  bool hasUserREF() => _userREF != null;

  // "clientsREFList" field.
  List<DocumentReference>? _clientsREFList;
  List<DocumentReference> get clientsREFList => _clientsREFList ?? const [];
  bool hasClientsREFList() => _clientsREFList != null;

  void _initializeFields() {
    _userREF = snapshotData['userREF'] as DocumentReference?;
    _clientsREFList = getDataList(snapshotData['clientsREFList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite_clients');

  static Stream<FavoriteClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteClientsRecord.fromSnapshot(s));

  static Future<FavoriteClientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteClientsRecord.fromSnapshot(s));

  static FavoriteClientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteClientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteClientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteClientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteClientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteClientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteClientsRecordData({
  DocumentReference? userREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userREF': userREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteClientsRecordDocumentEquality
    implements Equality<FavoriteClientsRecord> {
  const FavoriteClientsRecordDocumentEquality();

  @override
  bool equals(FavoriteClientsRecord? e1, FavoriteClientsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userREF == e2?.userREF &&
        listEquality.equals(e1?.clientsREFList, e2?.clientsREFList);
  }

  @override
  int hash(FavoriteClientsRecord? e) =>
      const ListEquality().hash([e?.userREF, e?.clientsREFList]);

  @override
  bool isValidKey(Object? o) => o is FavoriteClientsRecord;
}
