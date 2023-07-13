import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/components/user_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'clients_list_model.dart';
export 'clients_list_model.dart';

class ClientsListWidget extends StatefulWidget {
  const ClientsListWidget({Key? key}) : super(key: key);

  @override
  _ClientsListWidgetState createState() => _ClientsListWidgetState();
}

class _ClientsListWidgetState extends State<ClientsListWidget> {
  late ClientsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClientsListModel());

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

    return StreamBuilder<List<FavoriteClientsRecord>>(
      stream: FFAppState().clients(
        requestFn: () => queryFavoriteClientsRecord(
          queryBuilder: (favoriteClientsRecord) => favoriteClientsRecord
              .where('userREF', isEqualTo: currentUserReference),
          singleRecord: true,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<FavoriteClientsRecord> clientsListFavoriteClientsRecordList =
            snapshot.data!;
        final clientsListFavoriteClientsRecord =
            clientsListFavoriteClientsRecordList.isNotEmpty
                ? clientsListFavoriteClientsRecordList.first
                : null;
        return Title(
            title: 'clientsList',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
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
                          'Клієнти',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Roboto',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                              ),
                        ),
                        actions: [],
                        centerTitle: true,
                        elevation: 2.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: DefaultTabController(
                                  length: 3,
                                  initialIndex: 0,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14.0,
                                                  ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          indicatorWeight: 3.0,
                                          tabs: [
                                            Tab(
                                              text: 'Усі',
                                            ),
                                            Tab(
                                              text: 'Обрані',
                                            ),
                                            StreamBuilder<
                                                List<TempUsersRecord>>(
                                              stream: queryTempUsersRecord(
                                                queryBuilder: (tempUsersRecord) =>
                                                    tempUsersRecord.where(
                                                        'owner',
                                                        isEqualTo:
                                                            currentUserReference),
                                                singleRecord: true,
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
                                                List<TempUsersRecord>
                                                    addedByMeTempUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final addedByMeTempUsersRecord =
                                                    addedByMeTempUsersRecordList
                                                            .isNotEmpty
                                                        ? addedByMeTempUsersRecordList
                                                            .first
                                                        : null;
                                                return Tab(
                                                  text: 'Додані мною',
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            Visibility(
                                              visible: (currentUserDocument
                                                              ?.allClients
                                                              ?.toList() ??
                                                          [])
                                                      .length >
                                                  0,
                                              child: AuthUserStreamWidget(
                                                builder: (context) =>
                                                    SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final myClient =
                                                                  (currentUserDocument
                                                                              ?.allClients
                                                                              ?.toList() ??
                                                                          [])
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();
                                                              if (myClient
                                                                  .isEmpty) {
                                                                return Image
                                                                    .asset(
                                                                  'assets/images/empty-all-client.png',
                                                                  width: 250.0,
                                                                  height: 250.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                );
                                                              }
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    myClient
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        myClientIndex) {
                                                                  final myClientItem =
                                                                      myClient[
                                                                          myClientIndex];
                                                                  return UserCardWidget(
                                                                    key: Key(
                                                                        'Key74p_${myClientIndex}_of_${myClient.length}'),
                                                                    userRef:
                                                                        myClientItem,
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
                                            ),
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final favoriteClient =
                                                            clientsListFavoriteClientsRecord
                                                                    ?.clientsREFList
                                                                    ?.map((e) =>
                                                                        e)
                                                                    .toList()
                                                                    ?.toList() ??
                                                                [];
                                                        if (favoriteClient
                                                            .isEmpty) {
                                                          return Image.asset(
                                                            'assets/images/no-favorite-clients.png',
                                                            width: 250.0,
                                                            height: 250.0,
                                                          );
                                                        }
                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              favoriteClient
                                                                  .length,
                                                          itemBuilder: (context,
                                                              favoriteClientIndex) {
                                                            final favoriteClientItem =
                                                                favoriteClient[
                                                                    favoriteClientIndex];
                                                            return UserCardWidget(
                                                              key: Key(
                                                                  'Keye3g_${favoriteClientIndex}_of_${favoriteClient.length}'),
                                                              userRef:
                                                                  favoriteClientItem,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: StreamBuilder<
                                                      List<TempUsersRecord>>(
                                                    stream:
                                                        queryTempUsersRecord(
                                                      queryBuilder: (tempUsersRecord) =>
                                                          tempUsersRecord.where(
                                                              'owner',
                                                              isEqualTo:
                                                                  currentUserReference),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TempUsersRecord>
                                                          listViewTempUsersRecordList =
                                                          snapshot.data!;
                                                      if (listViewTempUsersRecordList
                                                          .isEmpty) {
                                                        return Image.asset(
                                                          'assets/images/no-added-client.png',
                                                          width: 250.0,
                                                          height: 250.0,
                                                          fit: BoxFit.contain,
                                                        );
                                                      }
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewTempUsersRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewTempUsersRecord =
                                                              listViewTempUsersRecordList[
                                                                  listViewIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        3.0,
                                                                    color: Color(
                                                                        0x20000000),
                                                                    offset:
                                                                        Offset(
                                                                            0.0,
                                                                            1.0),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewTempUsersRecord.clientName,
                                                                              style: FlutterFlowTheme.of(context).titleMedium,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              listViewTempUsersRecord.clientPhone,
                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    fontSize: 14.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                FutureBuilder<int>(
                                                                              future: queryAppointmentsRecordCount(
                                                                                queryBuilder: (appointmentsRecord) => appointmentsRecord.where('withTempUser', isEqualTo: true).where('tempUserREF', isEqualTo: listViewTempUsersRecord.reference).where('time_start', isGreaterThan: getCurrentTimestamp),
                                                                              ),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: SpinKitRing(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }
                                                                                int textCount = snapshot.data!;
                                                                                return Text(
                                                                                  'Записів: ${textCount.toString()}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
              ),
            ));
      },
    );
  }
}
