import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlacesRecord extends FirestoreRecord {
  PlacesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  bool hasDefaultAddress() => _defaultAddress != null;

  // "lat_lng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  bool hasLatLng() => _latLng != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "cityREF" field.
  DocumentReference? _cityREF;
  DocumentReference? get cityREF => _cityREF;
  bool hasCityREF() => _cityREF != null;

  // "ownerREF" field.
  DocumentReference? _ownerREF;
  DocumentReference? get ownerREF => _ownerREF;
  bool hasOwnerREF() => _ownerREF != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  void _initializeFields() {
    _archived = snapshotData['archived'] as bool?;
    _defaultAddress = snapshotData['default_address'] as bool?;
    _latLng = snapshotData['lat_lng'] as LatLng?;
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _cityREF = snapshotData['cityREF'] as DocumentReference?;
    _ownerREF = snapshotData['ownerREF'] as DocumentReference?;
    _photos = getDataList(snapshotData['photos']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('places');

  static Stream<PlacesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlacesRecord.fromSnapshot(s));

  static Future<PlacesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlacesRecord.fromSnapshot(s));

  static PlacesRecord fromSnapshot(DocumentSnapshot snapshot) => PlacesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlacesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlacesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlacesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlacesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlacesRecordData({
  bool? archived,
  bool? defaultAddress,
  LatLng? latLng,
  String? name,
  String? address,
  DocumentReference? cityREF,
  DocumentReference? ownerREF,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'archived': archived,
      'default_address': defaultAddress,
      'lat_lng': latLng,
      'name': name,
      'address': address,
      'cityREF': cityREF,
      'ownerREF': ownerREF,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlacesRecordDocumentEquality implements Equality<PlacesRecord> {
  const PlacesRecordDocumentEquality();

  @override
  bool equals(PlacesRecord? e1, PlacesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.archived == e2?.archived &&
        e1?.defaultAddress == e2?.defaultAddress &&
        e1?.latLng == e2?.latLng &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.cityREF == e2?.cityREF &&
        e1?.ownerREF == e2?.ownerREF &&
        listEquality.equals(e1?.photos, e2?.photos);
  }

  @override
  int hash(PlacesRecord? e) => const ListEquality().hash([
        e?.archived,
        e?.defaultAddress,
        e?.latLng,
        e?.name,
        e?.address,
        e?.cityREF,
        e?.ownerREF,
        e?.photos
      ]);

  @override
  bool isValidKey(Object? o) => o is PlacesRecord;
}
