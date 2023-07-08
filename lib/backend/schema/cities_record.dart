import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CitiesRecord extends FirestoreRecord {
  CitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "search_names" field.
  List<String>? _searchNames;
  List<String> get searchNames => _searchNames ?? const [];
  bool hasSearchNames() => _searchNames != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "city_post_index" field.
  String? _cityPostIndex;
  String get cityPostIndex => _cityPostIndex ?? '';
  bool hasCityPostIndex() => _cityPostIndex != null;

  // "init_lat_lng" field.
  LatLng? _initLatLng;
  LatLng? get initLatLng => _initLatLng;
  bool hasInitLatLng() => _initLatLng != null;

  void _initializeFields() {
    _cityName = snapshotData['city_name'] as String?;
    _searchNames = getDataList(snapshotData['search_names']);
    _region = snapshotData['region'] as String?;
    _cityPostIndex = snapshotData['city_post_index'] as String?;
    _initLatLng = snapshotData['init_lat_lng'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cities');

  static Stream<CitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CitiesRecord.fromSnapshot(s));

  static Future<CitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CitiesRecord.fromSnapshot(s));

  static CitiesRecord fromSnapshot(DocumentSnapshot snapshot) => CitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCitiesRecordData({
  String? cityName,
  String? region,
  String? cityPostIndex,
  LatLng? initLatLng,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'city_name': cityName,
      'region': region,
      'city_post_index': cityPostIndex,
      'init_lat_lng': initLatLng,
    }.withoutNulls,
  );

  return firestoreData;
}

class CitiesRecordDocumentEquality implements Equality<CitiesRecord> {
  const CitiesRecordDocumentEquality();

  @override
  bool equals(CitiesRecord? e1, CitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cityName == e2?.cityName &&
        listEquality.equals(e1?.searchNames, e2?.searchNames) &&
        e1?.region == e2?.region &&
        e1?.cityPostIndex == e2?.cityPostIndex &&
        e1?.initLatLng == e2?.initLatLng;
  }

  @override
  int hash(CitiesRecord? e) => const ListEquality().hash([
        e?.cityName,
        e?.searchNames,
        e?.region,
        e?.cityPostIndex,
        e?.initLatLng
      ]);

  @override
  bool isValidKey(Object? o) => o is CitiesRecord;
}
