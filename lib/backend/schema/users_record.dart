import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "isMaster" field.
  bool? _isMaster;
  bool get isMaster => _isMaster ?? false;
  bool hasIsMaster() => _isMaster != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "isClient" field.
  bool? _isClient;
  bool get isClient => _isClient ?? false;
  bool hasIsClient() => _isClient != null;

  // "isGuest" field.
  bool? _isGuest;
  bool get isGuest => _isGuest ?? false;
  bool hasIsGuest() => _isGuest != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "cityREF" field.
  DocumentReference? _cityREF;
  DocumentReference? get cityREF => _cityREF;
  bool hasCityREF() => _cityREF != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  bool hasCityName() => _cityName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "all_clients" field.
  List<DocumentReference>? _allClients;
  List<DocumentReference> get allClients => _allClients ?? const [];
  bool hasAllClients() => _allClients != null;

  // "favorite_categories" field.
  List<String>? _favoriteCategories;
  List<String> get favoriteCategories => _favoriteCategories ?? const [];
  bool hasFavoriteCategories() => _favoriteCategories != null;

  // "phoneAndName" field.
  String? _phoneAndName;
  String get phoneAndName => _phoneAndName ?? '';
  bool hasPhoneAndName() => _phoneAndName != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _isMaster = snapshotData['isMaster'] as bool?;
    _isAdmin = snapshotData['isAdmin'] as bool?;
    _isClient = snapshotData['isClient'] as bool?;
    _isGuest = snapshotData['isGuest'] as bool?;
    _bio = snapshotData['bio'] as String?;
    _cityREF = snapshotData['cityREF'] as DocumentReference?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _cityName = snapshotData['city_name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _allClients = getDataList(snapshotData['all_clients']);
    _favoriteCategories = getDataList(snapshotData['favorite_categories']);
    _phoneAndName = snapshotData['phoneAndName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'created_time': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['created_time']),
          ),
          'isMaster': snapshot.data['isMaster'],
          'isAdmin': snapshot.data['isAdmin'],
          'isClient': snapshot.data['isClient'],
          'isGuest': snapshot.data['isGuest'],
          'bio': snapshot.data['bio'],
          'cityREF': safeGet(
            () => toRef(snapshot.data['cityREF']),
          ),
          'photo_url': snapshot.data['photo_url'],
          'city_name': snapshot.data['city_name'],
          'display_name': snapshot.data['display_name'],
          'uid': snapshot.data['uid'],
          'phone_number': snapshot.data['phone_number'],
          'all_clients': safeGet(
            () => snapshot.data['all_clients'].map((s) => toRef(s)).toList(),
          ),
          'favorite_categories': safeGet(
            () => snapshot.data['favorite_categories'].toList(),
          ),
          'phoneAndName': snapshot.data['phoneAndName'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  DateTime? createdTime,
  bool? isMaster,
  bool? isAdmin,
  bool? isClient,
  bool? isGuest,
  String? bio,
  DocumentReference? cityREF,
  String? photoUrl,
  String? cityName,
  String? displayName,
  String? uid,
  String? phoneNumber,
  String? phoneAndName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'created_time': createdTime,
      'isMaster': isMaster,
      'isAdmin': isAdmin,
      'isClient': isClient,
      'isGuest': isGuest,
      'bio': bio,
      'cityREF': cityREF,
      'photo_url': photoUrl,
      'city_name': cityName,
      'display_name': displayName,
      'uid': uid,
      'phone_number': phoneNumber,
      'phoneAndName': phoneAndName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.createdTime == e2?.createdTime &&
        e1?.isMaster == e2?.isMaster &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.isClient == e2?.isClient &&
        e1?.isGuest == e2?.isGuest &&
        e1?.bio == e2?.bio &&
        e1?.cityREF == e2?.cityREF &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.cityName == e2?.cityName &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.allClients, e2?.allClients) &&
        listEquality.equals(e1?.favoriteCategories, e2?.favoriteCategories) &&
        e1?.phoneAndName == e2?.phoneAndName;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.createdTime,
        e?.isMaster,
        e?.isAdmin,
        e?.isClient,
        e?.isGuest,
        e?.bio,
        e?.cityREF,
        e?.photoUrl,
        e?.cityName,
        e?.displayName,
        e?.uid,
        e?.phoneNumber,
        e?.allClients,
        e?.favoriteCategories,
        e?.phoneAndName
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
