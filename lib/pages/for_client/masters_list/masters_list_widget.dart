import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/master_from_place/master_from_place_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/user_card_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'masters_list_model.dart';
export 'masters_list_model.dart';

class MastersListWidget extends StatefulWidget {
  const MastersListWidget({
    Key? key,
    String? initCategoryName,
  })  : this.initCategoryName = initCategoryName ?? 'Манікюр',
        super(key: key);

  final String initCategoryName;

  @override
  _MastersListWidgetState createState() => _MastersListWidgetState();
}

class _MastersListWidgetState extends State<MastersListWidget> {
  late MastersListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MastersListModel());

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
        title: 'mastersList',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
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
                      'Майстри',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
            body: StreamBuilder<List<FavoriteMastersRecord>>(
              stream: FFAppState().masters(
                requestFn: () => queryFavoriteMastersRecord(
                  queryBuilder: (favoriteMastersRecord) => favoriteMastersRecord
                      .where('userREF', isEqualTo: currentUserReference),
                  singleRecord: true,
                ),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<FavoriteMastersRecord> columnFavoriteMastersRecordList =
                    snapshot.data!;
                final columnFavoriteMastersRecord =
                    columnFavoriteMastersRecordList.isNotEmpty
                        ? columnFavoriteMastersRecordList.first
                        : null;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: DefaultTabController(
                        length: 4,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: false,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14.0,
                                    ),
                                unselectedLabelStyle:
                                    FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          fontSize: 14.0,
                                        ),
                                labelColor:
                                    FlutterFlowTheme.of(context).tertiary,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderWidth: 0.0,
                                borderRadius: 0.0,
                                elevation: 0.0,
                                tabs: [
                                  Tab(
                                    text: 'Усі',
                                  ),
                                  Tab(
                                    text: 'Обрані',
                                  ),
                                  Tab(
                                    text: 'Найраніше',
                                  ),
                                  Tab(
                                    text: 'Найближче',
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 0.0),
                                          child: StreamBuilder<
                                              List<CategoriesRecord>>(
                                            stream: queryCategoriesRecord(
                                              queryBuilder:
                                                  (categoriesRecord) =>
                                                      categoriesRecord
                                                          .orderBy('sort'),
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
                                              List<CategoriesRecord>
                                                  dropDownCategoriesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownValueController1 ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownValue1 ??=
                                                      FFAppState()
                                                          .currentCategoryName,
                                                ),
                                                options:
                                                    dropDownCategoriesRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownValue1 = val);
                                                  setState(() {
                                                    FFAppState()
                                                            .currentCategoryName =
                                                        _model.dropDownValue1!;
                                                  });
                                                },
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                hintText: 'Обери послугу',
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                borderWidth: 1.0,
                                                borderRadius: 10.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 10.0, 10.0, 0.0),
                                            child: StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord
                                                        .where('isMaster',
                                                            isEqualTo: true)
                                                        .where(
                                                            'favorite_categories',
                                                            arrayContains:
                                                                FFAppState()
                                                                    .currentCategoryName),
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
                                                List<UsersRecord>
                                                    listViewUsersRecordList =
                                                    snapshot.data!;
                                                if (listViewUsersRecordList
                                                    .isEmpty) {
                                                  return Image.asset(
                                                    'assets/images/no-masters-in-category.png',
                                                    width: 250.0,
                                                    height: 250.0,
                                                    fit: BoxFit.contain,
                                                  );
                                                }
                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewUsersRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, listViewIndex) {
                                                    final listViewUsersRecord =
                                                        listViewUsersRecordList[
                                                            listViewIndex];
                                                    return UserCardWidget(
                                                      key: Key(
                                                          'Keymmp_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                                                      userRef:
                                                          listViewUsersRecord
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
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final favMaster =
                                                  columnFavoriteMastersRecord
                                                          ?.mastersREFList
                                                          ?.map((e) => e)
                                                          .toList()
                                                          ?.toList() ??
                                                      [];
                                              if (favMaster.isEmpty) {
                                                return Image.asset(
                                                  'assets/images/no-favorite-masters.png',
                                                  width: 250.0,
                                                  height: 250.0,
                                                  fit: BoxFit.contain,
                                                );
                                              }
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: favMaster.length,
                                                itemBuilder:
                                                    (context, favMasterIndex) {
                                                  final favMasterItem =
                                                      favMaster[favMasterIndex];
                                                  return UserCardWidget(
                                                    key: Key(
                                                        'Keyay4_${favMasterIndex}_of_${favMaster.length}'),
                                                    userRef: favMasterItem,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 0.0),
                                          child: StreamBuilder<
                                              List<CategoriesRecord>>(
                                            stream: queryCategoriesRecord(
                                              queryBuilder:
                                                  (categoriesRecord) =>
                                                      categoriesRecord
                                                          .orderBy('sort'),
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
                                              List<CategoriesRecord>
                                                  dropDownCategoriesRecordList =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .dropDownValueController2 ??=
                                                    FormFieldController<String>(
                                                  _model.dropDownValue2 ??=
                                                      FFAppState()
                                                          .currentCategoryName,
                                                ),
                                                options:
                                                    dropDownCategoriesRecordList
                                                        .map((e) => e.name)
                                                        .toList(),
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                      .dropDownValue2 = val);
                                                  setState(() {
                                                    FFAppState()
                                                            .currentCategoryName =
                                                        _model.dropDownValue2!;
                                                  });
                                                },
                                                width: double.infinity,
                                                height: 50.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                hintText: 'Обери послугу',
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                borderWidth: 1.0,
                                                borderRadius: 10.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 4.0, 12.0, 4.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          child:
                                              StreamBuilder<List<UsersRecord>>(
                                            stream: queryUsersRecord(
                                              queryBuilder: (usersRecord) =>
                                                  usersRecord
                                                      .where('isMaster',
                                                          isEqualTo: true)
                                                      .where(
                                                          'favorite_categories',
                                                          arrayContains:
                                                              FFAppState()
                                                                  .currentCategoryName),
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
                                              List<UsersRecord>
                                                  columnUsersRecordList =
                                                  snapshot.data!;
                                              if (columnUsersRecordList
                                                  .isEmpty) {
                                                return Image.asset(
                                                  'assets/images/no-masters-in-category.png',
                                                  width: 250.0,
                                                  height: 250.0,
                                                  fit: BoxFit.contain,
                                                );
                                              }
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnUsersRecordList
                                                        .length, (columnIndex) {
                                                  final columnUsersRecord =
                                                      columnUsersRecordList[
                                                          columnIndex];
                                                  return StreamBuilder<
                                                      List<AppointmentsRecord>>(
                                                    stream:
                                                        queryAppointmentsRecord(
                                                      queryBuilder: (appointmentsRecord) => appointmentsRecord
                                                          .where('time_start',
                                                              isGreaterThan:
                                                                  dateTimeFromSecondsSinceEpoch(
                                                                      getCurrentTimestamp
                                                                          .secondsSinceEpoch))
                                                          .where('isActive',
                                                              isEqualTo: true)
                                                          .where('masterREF',
                                                              isEqualTo:
                                                                  columnUsersRecord
                                                                      .reference)
                                                          .orderBy(
                                                              'time_start'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                          mastersAllAppointmentsRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: UserCardWidget(
                                                          key: Key(
                                                              'Key03b_${columnIndex}_of_${columnUsersRecordList.length}'),
                                                          userRef:
                                                              columnUsersRecord
                                                                  .reference,
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }).addToStart(
                                                    SizedBox(height: 10.0)),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<CitiesRecord>>(
                                      stream: queryCitiesRecord(
                                        queryBuilder: (citiesRecord) =>
                                            citiesRecord.where('city_name',
                                                isEqualTo: valueOrDefault(
                                                    currentUserDocument
                                                        ?.cityName,
                                                    '')),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
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
                                          );
                                        }
                                        List<CitiesRecord>
                                            containerCitiesRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerCitiesRecord =
                                            containerCitiesRecordList.isNotEmpty
                                                ? containerCitiesRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: StreamBuilder<
                                                    List<CategoriesRecord>>(
                                                  stream: queryCategoriesRecord(
                                                    queryBuilder:
                                                        (categoriesRecord) =>
                                                            categoriesRecord
                                                                .orderBy(
                                                                    'sort'),
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
                                                    List<CategoriesRecord>
                                                        categoryFieldOnMapCategoriesRecordList =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .categoryFieldOnMapValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.categoryFieldOnMapValue ??=
                                                            FFAppState()
                                                                .currentCategoryName,
                                                      ),
                                                      options:
                                                          categoryFieldOnMapCategoriesRecordList
                                                              .map(
                                                                  (e) => e.name)
                                                              .toList(),
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .categoryFieldOnMapValue =
                                                            val); // Категорії На Карті
                                                        FFAppState().update(() {
                                                          FFAppState()
                                                                  .currentCategoryName =
                                                              _model
                                                                  .categoryFieldOnMapValue!;
                                                        });
                                                      },
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                      hintText: 'Обери послугу',
                                                      fillColor: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      borderWidth: 1.0,
                                                      borderRadius: 10.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  4.0,
                                                                  12.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder: (usersRecord) =>
                                                          usersRecord
                                                              .where('isMaster',
                                                                  isEqualTo:
                                                                      true)
                                                              .where(
                                                                  'favorite_categories',
                                                                  arrayContains:
                                                                      FFAppState()
                                                                          .currentCategoryName),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<UsersRecord>
                                                          containerUsersRecordList =
                                                          snapshot.data!;
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: StreamBuilder<
                                                            List<PlacesRecord>>(
                                                          stream:
                                                              queryPlacesRecord(
                                                            queryBuilder: (placesRecord) =>
                                                                placesRecord.whereIn(
                                                                    'ownerREF',
                                                                    containerUsersRecordList
                                                                        .map((e) =>
                                                                            e.reference)
                                                                        .toList()),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
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
                                                            List<PlacesRecord>
                                                                googleMapPlacesRecordList =
                                                                snapshot.data!;
                                                            return FlutterFlowGoogleMap(
                                                              controller: _model
                                                                  .googleMapsController,
                                                              onCameraIdle:
                                                                  (latLng) =>
                                                                      _model.googleMapsCenter =
                                                                          latLng,
                                                              initialLocation: _model
                                                                      .googleMapsCenter ??=
                                                                  containerCitiesRecord!
                                                                      .initLatLng!,
                                                              markers:
                                                                  googleMapPlacesRecordList
                                                                      .map(
                                                                        (googleMapPlacesRecord) =>
                                                                            FlutterFlowMarker(
                                                                          googleMapPlacesRecord
                                                                              .reference
                                                                              .path,
                                                                          googleMapPlacesRecord
                                                                              .latLng!,
                                                                          () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return GestureDetector(
                                                                                  onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                  child: Padding(
                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                    child: MasterFromPlaceWidget(
                                                                                      place: googleMapPlacesRecord,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                setState(() {}));
                                                                          },
                                                                        ),
                                                                      )
                                                                      .toList(),
                                                              markerColor:
                                                                  GoogleMarkerColor
                                                                      .orange,
                                                              mapType: MapType
                                                                  .normal,
                                                              style:
                                                                  GoogleMapStyle
                                                                      .standard,
                                                              initialZoom: 10.0,
                                                              allowInteraction:
                                                                  true,
                                                              allowZoom: true,
                                                              showZoomControls:
                                                                  true,
                                                              showLocation:
                                                                  true,
                                                              showCompass:
                                                                  false,
                                                              showMapToolbar:
                                                                  false,
                                                              showTraffic:
                                                                  false,
                                                              centerMapOnMarkerTap:
                                                                  true,
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                    wrapWithModel(
                      model: _model.navBarModel,
                      updateCallback: () => setState(() {}),
                      child: NavBarWidget(),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
