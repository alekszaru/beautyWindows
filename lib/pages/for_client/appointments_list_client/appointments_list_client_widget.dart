import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'appointments_list_client_model.dart';
export 'appointments_list_client_model.dart';

class AppointmentsListClientWidget extends StatefulWidget {
  const AppointmentsListClientWidget({
    Key? key,
    this.categoryRef,
  }) : super(key: key);

  final DocumentReference? categoryRef;

  @override
  _AppointmentsListClientWidgetState createState() =>
      _AppointmentsListClientWidgetState();
}

class _AppointmentsListClientWidgetState
    extends State<AppointmentsListClientWidget> with TickerProviderStateMixin {
  late AppointmentsListClientModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentsListClientModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'appointmentsListClient',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            )
                ? AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    leading: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                    ),
                    title: Text(
                      'Ваші записи',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 20.0,
                              ),
                    ),
                    actions: [],
                    centerTitle: true,
                    elevation: 2.0,
                  )
                : null,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).tertiary,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).titleMedium,
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryText,
                          indicatorWeight: 3.0,
                          tabs: [
                            Tab(
                              text: 'Наступні',
                            ),
                            Tab(
                              text: 'Завершені',
                            ),
                          ],
                          controller: _model.tabBarController,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 60.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: StreamBuilder<
                                            List<AppointmentsRecord>>(
                                          stream: queryAppointmentsRecord(
                                            queryBuilder: (appointmentsRecord) =>
                                                appointmentsRecord
                                                    .where('time_start',
                                                        isGreaterThanOrEqualTo:
                                                            getCurrentTimestamp)
                                                    .where('clientREF',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .orderBy('time_start'),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<AppointmentsRecord>
                                                listAppClientAppointmentsRecordList =
                                                snapshot.data!;
                                            if (listAppClientAppointmentsRecordList
                                                .isEmpty) {
                                              return Image.asset(
                                                'assets/images/no-appointment-with-client.png',
                                                width: 250.0,
                                                height: 250.0,
                                                fit: BoxFit.contain,
                                              );
                                            }
                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                10.0,
                                                0,
                                                0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listAppClientAppointmentsRecordList
                                                      .length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 10.0),
                                              itemBuilder: (context,
                                                  listAppClientIndex) {
                                                final listAppClientAppointmentsRecord =
                                                    listAppClientAppointmentsRecordList[
                                                        listAppClientIndex];
                                                return AppCardWidget(
                                                  key: Key(
                                                      'Key0cc_${listAppClientIndex}_of_${listAppClientAppointmentsRecordList.length}'),
                                                  appREF:
                                                      listAppClientAppointmentsRecord
                                                          .reference,
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: PagedListView<
                                          DocumentSnapshot<Object?>?,
                                          AppointmentsRecord>.separated(
                                        pagingController:
                                            _model.setListAppClientController2(
                                          AppointmentsRecord.collection
                                              .where('clientREF',
                                                  isEqualTo:
                                                      currentUserReference)
                                              .where('time_start',
                                                  isLessThan:
                                                      dateTimeFromSecondsSinceEpoch(
                                                          getCurrentTimestamp
                                                              .secondsSinceEpoch))
                                              .orderBy('time_start',
                                                  descending: true),
                                        ),
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          10.0,
                                          0,
                                          0,
                                        ),
                                        shrinkWrap: true,
                                        reverse: false,
                                        scrollDirection: Axis.vertical,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        builderDelegate:
                                            PagedChildBuilderDelegate<
                                                AppointmentsRecord>(
                                          // Customize what your widget looks like when it's loading the first page.
                                          firstPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          // Customize what your widget looks like when it's loading another page.
                                          newPageProgressIndicatorBuilder:
                                              (_) => Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              Image.asset(
                                            'assets/images/no-finished-appointment-with-client.png',
                                            width: 250.0,
                                            height: 250.0,
                                            fit: BoxFit.contain,
                                          ),
                                          itemBuilder:
                                              (context, _, listAppClientIndex) {
                                            final listAppClientAppointmentsRecord =
                                                _model.listAppClientPagingController2!
                                                        .itemList![
                                                    listAppClientIndex];
                                            return AppCardWidget(
                                              key: Key(
                                                  'Keywwz_${listAppClientIndex}_of_${_model.listAppClientPagingController2!.itemList!.length}'),
                                              appREF:
                                                  listAppClientAppointmentsRecord
                                                      .reference,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                wrapWithModel(
                  model: _model.navBarModel,
                  updateCallback: () => setState(() {}),
                  child: NavBarWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
