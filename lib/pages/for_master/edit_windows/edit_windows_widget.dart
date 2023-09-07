import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/add_client_towindow_sheet/add_client_towindow_sheet_widget.dart';
import '/components/add_window/add_window_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_windows_model.dart';
export 'edit_windows_model.dart';

class EditWindowsWidget extends StatefulWidget {
  const EditWindowsWidget({
    Key? key,
    this.initialDate,
  }) : super(key: key);

  final DateTime? initialDate;

  @override
  _EditWindowsWidgetState createState() => _EditWindowsWidgetState();
}

class _EditWindowsWidgetState extends State<EditWindowsWidget> {
  late EditWindowsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditWindowsModel());

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

    return StreamBuilder<List<AppointmentsRecord>>(
      stream: queryAppointmentsRecord(
        queryBuilder: (appointmentsRecord) => appointmentsRecord
            .where('masterREF', isEqualTo: currentUserReference)
            .where('time_start',
                isGreaterThan: functions
                    .getTimeStampRangeForDayBefore(_model.calendarSelectedDay)
                    ?.start)
            .where('time_start',
                isLessThan: functions
                    .getTimeStampRangeForDayBefore(_model.calendarSelectedDay)
                    ?.end),
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
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<AppointmentsRecord> editWindowsAppointmentsRecordList =
            snapshot.data!;
        return Title(
            title: 'editWindows',
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
                            context.pushNamed('mainPageMaster');
                          },
                        ),
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Редагуй свій розклад',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        actions: [],
                        centerTitle: true,
                        elevation: 2.0,
                      )
                    : null,
                body: FutureBuilder<int>(
                  future: (_model.firestoreRequestCompleter ??= Completer<int>()
                        ..complete(queryAppointmentsRecordCount(
                          queryBuilder: (appointmentsRecord) =>
                              appointmentsRecord
                                  .where('masterREF',
                                      isEqualTo: currentUserReference)
                                  .where('time_start',
                                      isGreaterThan:
                                          _model.calendarSelectedDay?.start)
                                  .where('time_start',
                                      isLessThan:
                                          _model.calendarSelectedDay?.end),
                        )))
                      .future,
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
                    int columnCount = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowCalendar(
                            color: Color(0xFF0933E3),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            weekFormat: true,
                            weekStartsMonday: true,
                            initialDate: widget.initialDate,
                            onChange: (DateTimeRange? newSelectedDate) {
                              setState(() =>
                                  _model.calendarSelectedDay = newSelectedDate);
                            },
                            titleStyle:
                                FlutterFlowTheme.of(context).titleMedium,
                            dayOfWeekStyle:
                                FlutterFlowTheme.of(context).titleSmall,
                            dateStyle: GoogleFonts.getFont(
                              'Roboto',
                              color: Color(0xFF827979),
                            ),
                            selectedDateStyle: GoogleFonts.getFont(
                              'Roboto',
                            ),
                            inactiveDateStyle: GoogleFonts.getFont(
                              'Roboto',
                            ),
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 20.0, 20.0, 20.0),
                            child: StreamBuilder<List<AppointmentsRecord>>(
                              stream: queryAppointmentsRecord(
                                queryBuilder: (appointmentsRecord) =>
                                    appointmentsRecord
                                        .where(
                                            'time_start',
                                            isLessThan: _model
                                                .calendarSelectedDay?.end)
                                        .where(
                                            'time_start',
                                            isGreaterThan: _model
                                                .calendarSelectedDay?.start)
                                        .where('masterREF',
                                            isEqualTo: currentUserReference),
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
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<AppointmentsRecord>
                                    gridViewAppointmentsRecordList =
                                    snapshot.data!;
                                return GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20.0,
                                    mainAxisSpacing: 20.0,
                                    childAspectRatio: 3.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      gridViewAppointmentsRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewAppointmentsRecord =
                                        gridViewAppointmentsRecordList[
                                            gridViewIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (gridViewAppointmentsRecord
                                            .isActive) {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Color(0x721C1C1C),
                                            barrierColor: Color(0x6B1C1C1C),
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      AddClientTowindowSheetWidget(
                                                    appointmentREF:
                                                        gridViewAppointmentsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        } else {
                                          context.pushNamed(
                                            'appointmentDetailsMaster',
                                            queryParameters: {
                                              'appointmentRef': serializeParam(
                                                gridViewAppointmentsRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: valueOrDefault<Color>(
                                              gridViewAppointmentsRecord
                                                          .isActive &&
                                                      (gridViewAppointmentsRecord
                                                              .timeStart! >
                                                          getCurrentTimestamp)
                                                  ? FlutterFlowTheme.of(context)
                                                      .accent2
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              dateTimeFormat(
                                                'Hm',
                                                gridViewAppointmentsRecord
                                                    .timeStart!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .platinum,
                                                        fontSize: 16.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  barrierColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => FocusScope.of(context)
                                          .requestFocus(_model.unfocusNode),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: AddWindowWidget(
                                          date:
                                              _model.calendarSelectedDay?.start,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              text: 'Додай нове віконце',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).info,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Open Sans',
                                      color: FlutterFlowTheme.of(context).white,
                                    ),
                                elevation: 5.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          FutureBuilder<int>(
                            future: queryAppointmentsRecordCount(
                              queryBuilder: (appointmentsRecord) =>
                                  appointmentsRecord
                                      .where('masterREF',
                                          isEqualTo: currentUserReference)
                                      .where('time_start',
                                          isGreaterThan: functions
                                              .getTimeStampRangeForDayBefore(
                                                  _model.calendarSelectedDay)
                                              ?.start)
                                      .where('time_start',
                                          isLessThan: functions
                                              .getTimeStampRangeForDayBefore(
                                                  _model.calendarSelectedDay)
                                              ?.end),
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
                              int containerCount = snapshot.data!;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Visibility(
                                  visible: containerCount > 0,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await actions
                                            .getAppointmentsFromPrevDay(
                                          _model.calendarSelectedDay!.start,
                                        );
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        setState(() => _model
                                            .firestoreRequestCompleter = null);
                                        await _model
                                            .waitForFirestoreRequestCompleted();
                                      },
                                      text: 'Скопіюй розклад попереднього дня',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFE35456),
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
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ));
      },
    );
  }
}
