import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_client/add_client_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class AddClientTowindowSheetModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for newClientPhone widget.
  TextEditingController? newClientPhoneController;
  String? Function(BuildContext, String?)? newClientPhoneControllerValidator;
  // Algolia Search Results from action on newClientPhone
  List<UsersRecord>? algoliaSearchResults = [];
  List<TempUsersRecord> simpleSearchResults = [];
  // State field(s) for CheckboxListTile widget.

  Map<String, bool> checkboxListTileValueMap = {};
  List<String> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    newClientPhoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
