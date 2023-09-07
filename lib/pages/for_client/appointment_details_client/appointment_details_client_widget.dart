import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'appointment_details_client_model.dart';
export 'appointment_details_client_model.dart';

class AppointmentDetailsClientWidget extends StatefulWidget {
  const AppointmentDetailsClientWidget({
    Key? key,
    this.appointmentRef,
  }) : super(key: key);

  final DocumentReference? appointmentRef;

  @override
  _AppointmentDetailsClientWidgetState createState() =>
      _AppointmentDetailsClientWidgetState();
}

class _AppointmentDetailsClientWidgetState
    extends State<AppointmentDetailsClientWidget> {
  late AppointmentDetailsClientModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentDetailsClientModel());

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
        title: 'appointmentDetailsClient',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
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
                    'Запис до майстра',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Roboto',
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (valueOrDefault<bool>(
                      currentUserDocument?.isClient, false))
                    AuthUserStreamWidget(
                      builder: (context) => StreamBuilder<AppointmentsRecord>(
                        stream: AppointmentsRecord.getDocument(
                            widget.appointmentRef!),
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
                          final clientContainerAppointmentsRecord =
                              snapshot.data!;
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: StreamBuilder<UsersRecord>(
                                      stream: UsersRecord.getDocument(
                                          clientContainerAppointmentsRecord
                                              .masterREF!),
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
                                        final cardUsersRecord = snapshot.data!;
                                        return Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          elevation: 4.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 5.0, 5.0, 5.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      if (cardUsersRecord
                                                                  .photoUrl !=
                                                              null &&
                                                          cardUsersRecord
                                                                  .photoUrl !=
                                                              '')
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'masterPage',
                                                              queryParameters: {
                                                                'masterRefParam':
                                                                    serializeParam(
                                                                  clientContainerAppointmentsRecord
                                                                      .masterREF,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child:
                                                                Image.network(
                                                              cardUsersRecord
                                                                  .photoUrl,
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    cardUsersRecord
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                  if (cardUsersRecord
                                                                              .phoneNumber !=
                                                                          null &&
                                                                      cardUsersRecord
                                                                              .phoneNumber !=
                                                                          '')
                                                                    Text(
                                                                      cardUsersRecord
                                                                          .phoneNumber,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              10.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.phone,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                20.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text(
                                                                                  'Телефонуємо майстру',
                                                                                  style: TextStyle(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                                ),
                                                                                duration: Duration(milliseconds: 4000),
                                                                                backgroundColor: Color(0x00000000),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              10.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.mail,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                30.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'chatDetails',
                                                                              queryParameters: {
                                                                                'chatUser': serializeParam(
                                                                                  cardUsersRecord,
                                                                                  ParamType.Document,
                                                                                ),
                                                                              }.withoutNulls,
                                                                              extra: <String, dynamic>{
                                                                                'chatUser': cardUsersRecord,
                                                                              },
                                                                            );
                                                                          },
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
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray600,
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      '${functions.getUkrainianDate(dateTimeFormat(
                                                        'd/M',
                                                        clientContainerAppointmentsRecord
                                                            .timeStart,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ))} ${dateTimeFormat(
                                                        'Hm',
                                                        clientContainerAppointmentsRecord
                                                            .timeStart,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .gray600,
                                                ),
                                                if (clientContainerAppointmentsRecord
                                                        .isActive ==
                                                    true)
                                                  Builder(
                                                    builder: (context) {
                                                      final category =
                                                          cardUsersRecord
                                                              .favoriteCategories
                                                              .map((e) => e)
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            category.length,
                                                            (categoryIndex) {
                                                          final categoryItem =
                                                              category[
                                                                  categoryIndex];
                                                          return Theme(
                                                            data: ThemeData(
                                                              unselectedWidgetColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                            child:
                                                                CheckboxListTile(
                                                              value: _model
                                                                          .checkboxListTileValueMap[
                                                                      categoryItem] ??=
                                                                  clientContainerAppointmentsRecord
                                                                      .categoriesNameList
                                                                      .contains(
                                                                          categoryItem),
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxListTileValueMap[
                                                                            categoryItem] =
                                                                        newValue!);
                                                              },
                                                              title: Text(
                                                                categoryItem,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge,
                                                              ),
                                                              tileColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              dense: false,
                                                              controlAffinity:
                                                                  ListTileControlAffinity
                                                                      .trailing,
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                if (clientContainerAppointmentsRecord
                                                        .isActive !=
                                                    true)
                                                  Builder(
                                                    builder: (context) {
                                                      final categoryInList =
                                                          clientContainerAppointmentsRecord
                                                              .categoriesNameList
                                                              .map((e) => e)
                                                              .toList();
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            categoryInList
                                                                .length,
                                                            (categoryInListIndex) {
                                                          final categoryInListItem =
                                                              categoryInList[
                                                                  categoryInListIndex];
                                                          return ListTile(
                                                            title: Text(
                                                              categoryInListItem,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge,
                                                            ),
                                                            tileColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            dense: false,
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 30.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if ((clientContainerAppointmentsRecord
                                                    .clientREF ==
                                                currentUserReference) &&
                                            (clientContainerAppointmentsRecord
                                                    .timeStart! >
                                                getCurrentTimestamp))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              await widget.appointmentRef!
                                                  .update({
                                                ...createAppointmentsRecordData(
                                                  isActive: true,
                                                ),
                                                'duration_in_minutes':
                                                    FieldValue.delete(),
                                                'total_price':
                                                    FieldValue.delete(),
                                                'clientREF':
                                                    FieldValue.delete(),
                                                'servicesREFList':
                                                    FieldValue.delete(),
                                                'categoriesNameList':
                                                    FieldValue.delete(),
                                              });
                                              // notifyMaster

                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createNotificationsRecordData(
                                                    userRef:
                                                        clientContainerAppointmentsRecord
                                                            .masterREF,
                                                    notification:
                                                        '${currentUserDisplayName} відмінила запис до тебе',
                                                    isNew: true,
                                                    time: getCurrentTimestamp,
                                                    type: 'cancel',
                                                    appREF:
                                                        widget.appointmentRef,
                                                  ));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Ваш запис відмінено',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                              context.pop();
                                            },
                                            text: 'Відмінити запис',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color: Color(0xFFE35456),
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        if (clientContainerAppointmentsRecord
                                            .isActive)
                                          FFButtonWidget(
                                            onPressed: () async {
                                              // UpdateAppointmentFields

                                              await widget.appointmentRef!
                                                  .update({
                                                ...createAppointmentsRecordData(
                                                  isActive: false,
                                                  clientREF:
                                                      currentUserReference,
                                                  withTempUser: false,
                                                  isCanceled: false,
                                                ),
                                                'categoriesNameList': _model
                                                    .checkboxListTileCheckedItems,
                                              });
                                              // addCurentToAllUsersForMaster

                                              await clientContainerAppointmentsRecord
                                                  .masterREF!
                                                  .update({
                                                'all_clients':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              });
                                              // notifyMaster

                                              await NotificationsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createNotificationsRecordData(
                                                    userRef:
                                                        clientContainerAppointmentsRecord
                                                            .masterREF,
                                                    notification:
                                                        'До тебе записалась ${currentUserDisplayName}',
                                                    isNew: true,
                                                    time: getCurrentTimestamp,
                                                    type: 'new',
                                                    appREF:
                                                        widget.appointmentRef,
                                                  ));
                                              // Є запис!
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Є запис! ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                              // Перехід

                                              context
                                                  .pushNamed('mainPageClient');
                                            },
                                            text: 'Записатись на цей час',
                                            options: FFButtonOptions(
                                              width: 200.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily: 'Open Sans',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white,
                                                      ),
                                              elevation: 5.0,
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed('mainPageClient');
                                      },
                                      text: 'Повернутись на головну',
                                      options: FFButtonOptions(
                                        width: 200.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Open Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                            ),
                                        elevation: 5.0,
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
