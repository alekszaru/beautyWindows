import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoriteMastersRecord extends FirestoreRecord {
  FavoriteMastersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userREF" field.
  DocumentReference? _userREF;
  DocumentReference? get userREF => _userREF;
  bool hasUserREF() => _userREF != null;

  // "mastersREFList" field.
  List<DocumentReference>? _mastersREFList;
  List<DocumentReference> get mastersREFList => _mastersREFList ?? const [];
  bool hasMastersREFList() => _mastersREFList != null;

  void _initializeFields() {
    _userREF = snapshotData['userREF'] as DocumentReference?;
    _mastersREFList = getDataList(snapshotData['mastersREFList']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('favorite_masters');

  static Stream<FavoriteMastersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FavoriteMastersRecord.fromSnapshot(s));

  static Future<FavoriteMastersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FavoriteMastersRecord.fromSnapshot(s));

  static FavoriteMastersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FavoriteMastersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FavoriteMastersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FavoriteMastersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FavoriteMastersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FavoriteMastersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFavoriteMastersRecordData({
  DocumentReference? userREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userREF': userREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class FavoriteMastersRecordDocumentEquality
    implements Equality<FavoriteMastersRecord> {
  const FavoriteMastersRecordDocumentEquality();

  @override
  bool equals(FavoriteMastersRecord? e1, FavoriteMastersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userREF == e2?.userREF &&
        listEquality.equals(e1?.mastersREFList, e2?.mastersREFList);
  }

  @override
  int hash(FavoriteMastersRecord? e) =>
      const ListEquality().hash([e?.userREF, e?.mastersREFList]);

  @override
  bool isValidKey(Object? o) => o is FavoriteMastersRecord;
}
