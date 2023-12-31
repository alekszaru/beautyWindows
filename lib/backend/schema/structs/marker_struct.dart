// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarkerStruct extends FFFirebaseStruct {
  MarkerStruct({
    String? name,
    double? latitude,
    double? longitude,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _latitude = latitude,
        _longitude = longitude,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  static MarkerStruct fromMap(Map<String, dynamic> data) => MarkerStruct(
        name: data['name'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
      );

  static MarkerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MarkerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'latitude': _latitude,
        'longitude': _longitude,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
      }.withoutNulls;

  static MarkerStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarkerStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MarkerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MarkerStruct &&
        name == other.name &&
        latitude == other.latitude &&
        longitude == other.longitude;
  }

  @override
  int get hashCode => const ListEquality().hash([name, latitude, longitude]);
}

MarkerStruct createMarkerStruct({
  String? name,
  double? latitude,
  double? longitude,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarkerStruct(
      name: name,
      latitude: latitude,
      longitude: longitude,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarkerStruct? updateMarkerStruct(
  MarkerStruct? marker, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    marker
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarkerStructData(
  Map<String, dynamic> firestoreData,
  MarkerStruct? marker,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (marker == null) {
    return;
  }
  if (marker.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && marker.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final markerData = getMarkerFirestoreData(marker, forFieldValue);
  final nestedData = markerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = marker.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarkerFirestoreData(
  MarkerStruct? marker, [
  bool forFieldValue = false,
]) {
  if (marker == null) {
    return {};
  }
  final firestoreData = mapToFirestore(marker.toMap());

  // Add any Firestore field values
  marker.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarkerListFirestoreData(
  List<MarkerStruct>? markers,
) =>
    markers?.map((e) => getMarkerFirestoreData(e, true)).toList() ?? [];
