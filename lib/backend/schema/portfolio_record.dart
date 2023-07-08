import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortfolioRecord extends FirestoreRecord {
  PortfolioRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "masterRef" field.
  DocumentReference? _masterRef;
  DocumentReference? get masterRef => _masterRef;
  bool hasMasterRef() => _masterRef != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "categoryRef" field.
  DocumentReference? _categoryRef;
  DocumentReference? get categoryRef => _categoryRef;
  bool hasCategoryRef() => _categoryRef != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  void _initializeFields() {
    _masterRef = snapshotData['masterRef'] as DocumentReference?;
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _categoryRef = snapshotData['categoryRef'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _categoryName = snapshotData['category_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('portfolio');

  static Stream<PortfolioRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PortfolioRecord.fromSnapshot(s));

  static Future<PortfolioRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PortfolioRecord.fromSnapshot(s));

  static PortfolioRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PortfolioRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PortfolioRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PortfolioRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PortfolioRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PortfolioRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPortfolioRecordData({
  DocumentReference? masterRef,
  DocumentReference? clientRef,
  DocumentReference? categoryRef,
  String? photoUrl,
  String? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'masterRef': masterRef,
      'clientRef': clientRef,
      'categoryRef': categoryRef,
      'photo_url': photoUrl,
      'category_name': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PortfolioRecordDocumentEquality implements Equality<PortfolioRecord> {
  const PortfolioRecordDocumentEquality();

  @override
  bool equals(PortfolioRecord? e1, PortfolioRecord? e2) {
    return e1?.masterRef == e2?.masterRef &&
        e1?.clientRef == e2?.clientRef &&
        e1?.categoryRef == e2?.categoryRef &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.categoryName == e2?.categoryName;
  }

  @override
  int hash(PortfolioRecord? e) => const ListEquality().hash([
        e?.masterRef,
        e?.clientRef,
        e?.categoryRef,
        e?.photoUrl,
        e?.categoryName
      ]);

  @override
  bool isValidKey(Object? o) => o is PortfolioRecord;
}
