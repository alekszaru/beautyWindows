import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_client_towindow_sheet_model.dart';
export 'add_client_towindow_sheet_model.dart';

class AddClientTowindowSheetWidget extends StatefulWidget {
  const AddClientTowindowSheetWidget({
    Key? key,
    this.appointmentREF,
  }) : super(key: key);

  final DocumentReference? appointmentREF;

  @override
  _AddClientTowindowSheetWidgetState createState() =>
      _AddClientTowindowSheetWidgetState();
}

class _AddClientTowindowSheetWidgetState
    extends State<AddClientTowindowSheetWidget> {
  late AddClientTowindowSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddClientTowindowSheetModel());

    _model.newClientPhoneController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        curve: Curves.elasticOut,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
        ),
        child: FutureBuilder<AppointmentsRecord>(
          future: AppointmentsRecord.getDocumentOnce(widget.appointmentREF!),
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
            final columnAppointmentsRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (valueOrDefault<bool>(
                        currentUserDocument?.isMaster, false) ==
                    true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                    child: AuthUserStreamWidget(
                      builder: (context) => Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 5.0, 5.0, 5.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).gray600,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${functions.getUkrainianDate(dateTimeFormat(
                                          'd/M',
                                          columnAppointmentsRecord.timeStart,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ))} ${dateTimeFormat(
                                          'Hm',
                                          columnAppointmentsRecord.timeStart,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).gray600,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  final _datePickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        columnAppointmentsRecord.timeStart!),
                                  );
                                  if (_datePickedTime != null) {
                                    setState(() {
                                      _model.datePicked = DateTime(
                                        columnAppointmentsRecord
                                            .timeStart!.year,
                                        columnAppointmentsRecord
                                            .timeStart!.month,
                                        columnAppointmentsRecord.timeStart!.day,
                                        _datePickedTime.hour,
                                        _datePickedTime.minute,
                                      );
                                    });
                                  }

                                  await widget.appointmentREF!
                                      .update(createAppointmentsRecordData(
                                    timeStart: _model.datePicked,
                                  ));
                                },
                                child: Text(
                                  'змінити час',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                      ),
                                ),
                              ),
                              if (columnAppointmentsRecord.clientREF != null)
                                StreamBuilder<UsersRecord>(
                                  stream: UsersRecord.getDocument(
                                      columnAppointmentsRecord.clientREF!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerUsersRecord = snapshot.data!;
                                    return Container(
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Image.network(
                                              containerUsersRecord.photoUrl,
                                              width: 40.0,
                                              height: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            containerUsersRecord.displayName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Text(
                                            containerUsersRecord.phoneNumber,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ]
                                            .divide(SizedBox(width: 10.0))
                                            .addToStart(SizedBox(width: 10.0)),
                                      ),
                                    );
                                  },
                                ),
                              if (columnAppointmentsRecord.clientREF == null)
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.newClientPhoneController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.newClientPhoneController',
                                          Duration(milliseconds: 500),
                                          () async {
                                            setState(() => _model
                                                .algoliaSearchResults = null);
                                            await UsersRecord.search(
                                              term: _model
                                                  .newClientPhoneController
                                                  .text,
                                              maxResults: 5,
                                            )
                                                .then((r) => _model
                                                    .algoliaSearchResults = r)
                                                .onError((_, __) => _model
                                                    .algoliaSearchResults = [])
                                                .whenComplete(
                                                    () => setState(() {}));
                                          },
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Введіть Ім\'я або телефон Клієнта',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                fontSize: 16.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                            ),
                                        validator: _model
                                            .newClientPhoneControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (_model.algoliaSearchResults
                                                ?.where((e) => e.isClient)
                                                .toList()
                                                ?.take(5)
                                                .toList() ==
                                            null) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitRing(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        final name = _model.algoliaSearchResults
                                                ?.where((e) => e.isClient)
                                                .toList()
                                                ?.take(5)
                                                .toList()
                                                ?.toList() ??
                                            [];
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: name.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 10.0),
                                          itemBuilder: (context, nameIndex) {
                                            final nameItem = name[nameIndex];
                                            return Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  await widget.appointmentREF!
                                                      .update(
                                                          createAppointmentsRecordData(
                                                    clientREF:
                                                        nameItem.reference,
                                                  ));
                                                  setState(() {
                                                    _model
                                                        .newClientPhoneController
                                                        ?.clear();
                                                  });
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      child: Image.network(
                                                        nameItem.photoUrl,
                                                        width: 40.0,
                                                        height: 40.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      nameItem.displayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                    Text(
                                                      nameItem.phoneNumber,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 10.0))
                                                      .addToStart(SizedBox(
                                                          width: 10.0)),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    if (_model.newClientPhoneController.text !=
                                            null &&
                                        _model.newClientPhoneController.text !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '+ ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                'Додати нового клієнта',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ]
                                                .divide(SizedBox(width: 10.0))
                                                .addToStart(
                                                    SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              Divider(
                                thickness: 2.0,
                                color: FlutterFlowTheme.of(context).gray600,
                              ),
                              Builder(
                                builder: (context) {
                                  final category = (currentUserDocument
                                              ?.favoriteCategories
                                              ?.toList() ??
                                          [])
                                      .map((e) => e)
                                      .toList();
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(category.length,
                                        (categoryIndex) {
                                      final categoryItem =
                                          category[categoryIndex];
                                      return Theme(
                                        data: ThemeData(
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                        child: CheckboxListTile(
                                          value: _model
                                                      .checkboxListTileValueMap[
                                                  categoryItem] ??=
                                              (currentUserDocument
                                                              ?.favoriteCategories
                                                              ?.toList() ??
                                                          [])
                                                      .contains(categoryItem) ==
                                                  false,
                                          onChanged: (newValue) async {
                                            setState(() =>
                                                _model.checkboxListTileValueMap[
                                                    categoryItem] = newValue!);
                                          },
                                          title: Text(
                                            categoryItem,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                ),
                                          ),
                                          tileColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          dense: false,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: StreamBuilder<List<TempUsersRecord>>(
                    stream: queryTempUsersRecord(
                      queryBuilder: (tempUsersRecord) => tempUsersRecord
                          .where('owner', isEqualTo: currentUserReference),
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
                      List<TempUsersRecord> buttonTempUsersRecordList =
                          snapshot.data!;
                      return FFButtonWidget(
                        onPressed: () async {
                          await widget.appointmentREF!.update({
                            ...createAppointmentsRecordData(
                              isActive: false,
                            ),
                            'categoriesNameList':
                                _model.checkboxListTileCheckedItems,
                          });

                          await currentUserReference!.update({
                            'all_clients': FieldValue.arrayUnion(
                                [columnAppointmentsRecord.clientREF]),
                          });
                          Navigator.pop(context);
                        },
                        text: 'Записати клієнта',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).info,
                          textStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
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
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.35),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (columnAppointmentsRecord.isActive == true) {
                            await columnAppointmentsRecord.reference.delete();
                          } else {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Видалення вікна з записом'),
                                      content: Text(
                                          'Ти хочеш видалити віконце з записом клієнта? ми надішлемо йому повідомлення'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('ні, не видаляти'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Так, аидалити'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await columnAppointmentsRecord.reference.delete();
                            }
                          }

                          context.pop();
                        },
                        text: 'Видалити віконце',
                        options: FFButtonOptions(
                          width: 200.0,
                          height: 50.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFE35456),
                          textStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
