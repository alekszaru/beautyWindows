import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _currentCategoryName =
          prefs.getString('ff_currentCategoryName') ?? _currentCategoryName;
    });
    _safeInit(() {
      _currentPageIndex =
          prefs.getInt('ff_currentPageIndex') ?? _currentPageIndex;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _tempClientRef =
      FirebaseFirestore.instance.doc('/tempUsers/4g0yfpYHqLm6P0hLa38N');
  DocumentReference? get tempClientRef => _tempClientRef;
  set tempClientRef(DocumentReference? _value) {
    _tempClientRef = _value;
  }

  String _defaultImageGirl =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/beauty-booking-wi5o7z/assets/i2rdl5yoqnls/woman.jpg';
  String get defaultImageGirl => _defaultImageGirl;
  set defaultImageGirl(String _value) {
    _defaultImageGirl = _value;
  }

  String _currentCategoryName = 'Манікюр';
  String get currentCategoryName => _currentCategoryName;
  set currentCategoryName(String _value) {
    _currentCategoryName = _value;
    prefs.setString('ff_currentCategoryName', _value);
  }

  String _nophoto =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/beauty-booking-wi5o7z/assets/e4spkn4ihrgj/nofoto.png';
  String get nophoto => _nophoto;
  set nophoto(String _value) {
    _nophoto = _value;
  }

  List<String> _findCategories = [];
  List<String> get findCategories => _findCategories;
  set findCategories(List<String> _value) {
    _findCategories = _value;
  }

  void addToFindCategories(String _value) {
    _findCategories.add(_value);
  }

  void removeFromFindCategories(String _value) {
    _findCategories.remove(_value);
  }

  void removeAtIndexFromFindCategories(int _index) {
    _findCategories.removeAt(_index);
  }

  void updateFindCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _findCategories[_index] = updateFn(_findCategories[_index]);
  }

  int _currentPageIndex = 0;
  int get currentPageIndex => _currentPageIndex;
  set currentPageIndex(int _value) {
    _currentPageIndex = _value;
    prefs.setInt('ff_currentPageIndex', _value);
  }

  final _clientsManager = StreamRequestManager<List<FavoriteClientsRecord>>();
  Stream<List<FavoriteClientsRecord>> clients({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<FavoriteClientsRecord>> Function() requestFn,
  }) =>
      _clientsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearClientsCache() => _clientsManager.clear();
  void clearClientsCacheKey(String? uniqueKey) =>
      _clientsManager.clearRequest(uniqueKey);

  final _mastersManager = StreamRequestManager<List<FavoriteMastersRecord>>();
  Stream<List<FavoriteMastersRecord>> masters({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<FavoriteMastersRecord>> Function() requestFn,
  }) =>
      _mastersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMastersCache() => _mastersManager.clear();
  void clearMastersCacheKey(String? uniqueKey) =>
      _mastersManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
