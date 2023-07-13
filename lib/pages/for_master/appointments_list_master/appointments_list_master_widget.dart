import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_card/app_card_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'appointments_list_master_model.dart';
export 'appointments_list_master_model.dart';

class AppointmentsListMasterWidget extends StatefulWidget {
  const AppointmentsListMasterWidget({Key? key}) : super(key: key);

  @override
  _AppointmentsListMasterWidgetState createState() =>
      _AppointmentsListMasterWidgetState();
}

class _AppointmentsListMasterWidgetState
    extends State<AppointmentsListMasterWidget> {
  late AppointmentsListMasterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentsListMasterModel());

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
        title: 'appointmentsListMaster',
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
                      'Записи до вас',
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
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            labelColor: FlutterFlowTheme.of(context).tertiary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle:
                                FlutterFlowTheme.of(context).titleMedium,
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
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child: FutureBuilder<
                                              List<AppointmentsRecord>>(
                                            future: queryAppointmentsRecordOnce(
                                              queryBuilder: (appointmentsRecord) =>
                                                  appointmentsRecord
                                                      .where('masterREF',
                                                          isEqualTo:
                                                              currentUserReference)
                                                      .where('time_start',
                                                          isGreaterThan:
                                                              getCurrentTimestamp)
                                                      .where('isActive',
                                                          isEqualTo: false),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitRing(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<AppointmentsRecord>
                                                  listAppMasterAppointmentsRecordList =
                                                  snapshot.data!;
                                              if (listAppMasterAppointmentsRecordList
                                                  .isEmpty) {
                                                return Center(
                                                  child: Image.asset(
                                                    'assets/images/no-appointment-with-client.png',
                                                    width: 250.0,
                                                    height: 250.0,
                                                  ),
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
                                                    listAppMasterAppointmentsRecordList
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 10.0),
                                                itemBuilder: (context,
                                                    listAppMasterIndex) {
                                                  final listAppMasterAppointmentsRecord =
                                                      listAppMasterAppointmentsRecordList[
                                                          listAppMasterIndex];
                                                  return AppCardWidget(
                                                    key: Key(
                                                        'Keynuv_${listAppMasterIndex}_of_${listAppMasterAppointmentsRecordList.length}'),
                                                    appREF:
                                                        listAppMasterAppointmentsRecord
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
                                          pagingController: _model
                                              .setListAppMasterController2(
                                            AppointmentsRecord.collection
                                                .where('masterREF',
                                                    isEqualTo:
                                                        currentUserReference)
                                                .where('time_start',
                                                    isLessThan:
                                                        dateTimeFromSecondsSinceEpoch(
                                                            getCurrentTimestamp
                                                                .secondsSinceEpoch))
                                                .where('isActive',
                                                    isEqualTo: false)
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
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                            // Customize what your widget looks like when it's loading another page.
                                            newPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                            noItemsFoundIndicatorBuilder: (_) =>
                                                Center(
                                              child: Image.asset(
                                                'assets/images/no-finished-appointment-with-client.png',
                                                width: 250.0,
                                                height: 250.0,
                                              ),
                                            ),
                                            itemBuilder: (context, _,
                                                listAppMasterIndex) {
                                              final listAppMasterAppointmentsRecord =
                                                  _model.listAppMasterPagingController2!
                                                          .itemList![
                                                      listAppMasterIndex];
                                              return AppCardWidget(
                                                key: Key(
                                                    'Keypbq_${listAppMasterIndex}_of_${_model.listAppMasterPagingController2!.itemList!.length}'),
                                                appREF:
                                                    listAppMasterAppointmentsRecord
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
                ),
                wrapWithModel(
                  model: _model.navBar1Model,
                  updateCallback: () => setState(() {}),
                  child: NavBar1Widget(),
                ),
              ],
            ),
          ),
        ));
  }
}
