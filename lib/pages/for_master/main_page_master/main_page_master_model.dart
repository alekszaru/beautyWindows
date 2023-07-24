import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/new_notify_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class MainPageMasterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Models for AppCard dynamic component.
  late FlutterFlowDynamicModels<AppCardModel> appCardModels;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Models for newNotify dynamic component.
  late FlutterFlowDynamicModels<NewNotifyModel> newNotifyModels1;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, NotificationsRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? deleteItems;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    appCardModels = FlutterFlowDynamicModels(() => AppCardModel());
    navBarModel = createModel(context, () => NavBarModel());
    newNotifyModels1 = FlutterFlowDynamicModels(() => NewNotifyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appCardModels.dispose();
    navBarModel.dispose();
    newNotifyModels1.dispose();
    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, NotificationsRecord>
      setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, NotificationsRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller = PagingController<DocumentSnapshot?, NotificationsRecord>(
        firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryNotificationsRecordPage(
          queryBuilder: (_) => listViewPagingQuery3 ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
