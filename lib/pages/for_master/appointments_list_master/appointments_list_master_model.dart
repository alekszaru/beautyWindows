import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AppointmentsListMasterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListAppMaster widget.

  PagingController<DocumentSnapshot?, AppointmentsRecord>?
      listAppMasterPagingController2;
  Query? listAppMasterPagingQuery2;

  // Model for NavBar component.
  late NavBarModel navBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();

    listAppMasterPagingController2?.dispose();

    navBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, AppointmentsRecord>
      setListAppMasterController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listAppMasterPagingController2 ??=
        _createListAppMasterController2(query, parent);
    if (listAppMasterPagingQuery2 != query) {
      listAppMasterPagingQuery2 = query;
      listAppMasterPagingController2?.refresh();
    }
    return listAppMasterPagingController2!;
  }

  PagingController<DocumentSnapshot?, AppointmentsRecord>
      _createListAppMasterController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, AppointmentsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAppointmentsRecordPage(
          queryBuilder: (_) => listAppMasterPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 10,
          isStream: false,
        ),
      );
  }
}
