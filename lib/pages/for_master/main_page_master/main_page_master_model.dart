import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/new_notify_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  // Model for NavBar1 component.
  late NavBar1Model navBar1Model;
  // Models for newNotify dynamic component.
  late FlutterFlowDynamicModels<NewNotifyModel> newNotifyModels1;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, NotificationsRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    appCardModels = FlutterFlowDynamicModels(() => AppCardModel());
    navBar1Model = createModel(context, () => NavBar1Model());
    newNotifyModels1 = FlutterFlowDynamicModels(() => NewNotifyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appCardModels.dispose();
    navBar1Model.dispose();
    newNotifyModels1.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
