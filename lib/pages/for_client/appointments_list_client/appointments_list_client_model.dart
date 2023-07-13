import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class AppointmentsListClientModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListAppClient widget.

  PagingController<DocumentSnapshot?, AppointmentsRecord>?
      listAppClientPagingController2;
  Query? listAppClientPagingQuery2;
  List<StreamSubscription?> listAppClientStreamSubscriptions2 = [];

  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBar1Model = createModel(context, () => NavBar1Model());
  }

  void dispose() {
    unfocusNode.dispose();
    listAppClientStreamSubscriptions2.forEach((s) => s?.cancel());
    listAppClientPagingController2?.dispose();

    navBar1Model.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, AppointmentsRecord>
      setListAppClientController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listAppClientPagingController2 ??=
        _createListAppClientController2(query, parent);
    if (listAppClientPagingQuery2 != query) {
      listAppClientPagingQuery2 = query;
      listAppClientPagingController2?.refresh();
    }
    return listAppClientPagingController2!;
  }

  PagingController<DocumentSnapshot?, AppointmentsRecord>
      _createListAppClientController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, AppointmentsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryAppointmentsRecordPage(
          queryBuilder: (_) => listAppClientPagingQuery2 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listAppClientStreamSubscriptions2,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
