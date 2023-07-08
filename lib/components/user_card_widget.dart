import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_card_model.dart';
export 'user_card_model.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({
    Key? key,
    this.userRef,
  }) : super(key: key);

  final DocumentReference? userRef;

  @override
  _UserCardWidgetState createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  late UserCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserCardModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(widget.userRef!),
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
          final containerUsersRecord = snapshot.data!;
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              if (containerUsersRecord.isMaster == true) {
                context.pushNamed(
                  'masterPage',
                  queryParameters: {
                    'masterRefParam': serializeParam(
                      widget.userRef,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              } else {
                context.pushNamed(
                  'clientPage',
                  queryParameters: {
                    'clientRefParameter': serializeParam(
                      widget.userRef,
                      ParamType.DocumentReference,
                    ),
                  }.withoutNulls,
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: Color(0x20000000),
                    offset: Offset(0.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        imageUrl: containerUsersRecord.photoUrl,
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              containerUsersRecord.displayName,
                              style: FlutterFlowTheme.of(context).titleMedium,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                '${containerUsersRecord.phoneNumber.substring(3)}',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 14.0,
                                    ),
                              ),
                            ),
                            if (containerUsersRecord.isMaster == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final category = containerUsersRecord
                                        .favoriteCategories
                                        .map((e) => e)
                                        .toList();
                                    return Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(category.length,
                                          (categoryIndex) {
                                        final categoryItem =
                                            category[categoryIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            categoryItem,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isMaster, false) ==
                                false)
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<FavoriteMastersRecord>>(
                                  stream: queryFavoriteMastersRecord(
                                    queryBuilder: (favoriteMastersRecord) =>
                                        favoriteMastersRecord.where('userREF',
                                            isEqualTo: currentUserReference),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FavoriteMastersRecord>
                                        toggleIconFavoriteMastersRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final toggleIconFavoriteMastersRecord =
                                        toggleIconFavoriteMastersRecordList
                                                .isNotEmpty
                                            ? toggleIconFavoriteMastersRecordList
                                                .first
                                            : null;
                                    return ToggleIcon(
                                      onPressed: () async {
                                        final mastersREFListElement =
                                            containerUsersRecord.reference;
                                        final mastersREFListUpdate =
                                            toggleIconFavoriteMastersRecord!.mastersREFList
                                                    .contains(
                                                        mastersREFListElement)
                                                ? FieldValue.arrayRemove(
                                                    [mastersREFListElement])
                                                : FieldValue.arrayUnion(
                                                    [mastersREFListElement]);
                                        await toggleIconFavoriteMastersRecord!
                                            .reference
                                            .update({
                                          'mastersREFList':
                                              mastersREFListUpdate,
                                        });
                                      },
                                      value: toggleIconFavoriteMastersRecord!
                                          .mastersREFList
                                          .contains(
                                              containerUsersRecord.reference),
                                      onIcon: Icon(
                                        Icons.favorite_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 25.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            if (valueOrDefault<bool>(
                                    currentUserDocument?.isMaster, false) ==
                                true)
                              AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<FavoriteClientsRecord>>(
                                  stream: queryFavoriteClientsRecord(
                                    queryBuilder: (favoriteClientsRecord) =>
                                        favoriteClientsRecord.where('userREF',
                                            isEqualTo: currentUserReference),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<FavoriteClientsRecord>
                                        toggleIconFavoriteClientsRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final toggleIconFavoriteClientsRecord =
                                        toggleIconFavoriteClientsRecordList
                                                .isNotEmpty
                                            ? toggleIconFavoriteClientsRecordList
                                                .first
                                            : null;
                                    return ToggleIcon(
                                      onPressed: () async {
                                        final clientsREFListElement =
                                            containerUsersRecord.reference;
                                        final clientsREFListUpdate =
                                            toggleIconFavoriteClientsRecord!.clientsREFList
                                                    .contains(
                                                        clientsREFListElement)
                                                ? FieldValue.arrayRemove(
                                                    [clientsREFListElement])
                                                : FieldValue.arrayUnion(
                                                    [clientsREFListElement]);
                                        await toggleIconFavoriteClientsRecord!
                                            .reference
                                            .update({
                                          'clientsREFList':
                                              clientsREFListUpdate,
                                        });
                                      },
                                      value: toggleIconFavoriteClientsRecord!
                                          .clientsREFList
                                          .contains(
                                              containerUsersRecord.reference),
                                      onIcon: Icon(
                                        Icons.favorite_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 25.0,
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                        FutureBuilder<List<AppointmentsRecord>>(
                          future: queryAppointmentsRecordOnce(
                            queryBuilder: (appointmentsRecord) =>
                                appointmentsRecord
                                    .where('isActive', isEqualTo: true)
                                    .where('time_start',
                                        isGreaterThan: getCurrentTimestamp)
                                    .where('masterREF',
                                        isEqualTo: widget.userRef)
                                    .orderBy('time_start'),
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<AppointmentsRecord>
                                containerAppointmentsRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerAppointmentsRecord =
                                containerAppointmentsRecordList.isNotEmpty
                                    ? containerAppointmentsRecordList.first
                                    : null;
                            return Container(
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible:
                                    (containerAppointmentsRecord != null) &&
                                        containerUsersRecord.isMaster,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Найближчий запис',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 10.0,
                                          ),
                                    ),
                                    Text(
                                      '${functions.getUkrainianDate(dateTimeFormat(
                                        'd/M',
                                        containerAppointmentsRecord!.timeStart,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ))} ${dateTimeFormat(
                                        'Hm',
                                        containerAppointmentsRecord!.timeStart,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      )}',
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
