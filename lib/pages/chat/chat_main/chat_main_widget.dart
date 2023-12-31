import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/nav_bar1/nav_bar1_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_main_model.dart';
export 'chat_main_model.dart';

class ChatMainWidget extends StatefulWidget {
  const ChatMainWidget({Key? key}) : super(key: key);

  @override
  _ChatMainWidgetState createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late ChatMainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMainModel());

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

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final chatMainUsersRecord = snapshot.data!;
        return Title(
            title: 'chatMain',
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
                      title: Text(
                        'Усі чати',
                        style: FlutterFlowTheme.of(context)
                            .displaySmall
                            .override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 18.0,
                            ),
                      ),
                      actions: [],
                      centerTitle: true,
                      elevation: 4.0,
                    )
                  : null,
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<ChatsRecord>>(
                              stream: queryChatsRecord(
                                queryBuilder: (chatsRecord) => chatsRecord
                                    .where('users',
                                        arrayContains: currentUserReference)
                                    .orderBy('last_message_time',
                                        descending: true),
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
                                List<ChatsRecord> containerChatsRecordList =
                                    snapshot.data!;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final allChats =
                                            containerChatsRecordList.toList();
                                        if (allChats.isEmpty) {
                                          return Center(
                                            child: EmptyListWidget(),
                                          );
                                        }
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: allChats.length,
                                          itemBuilder:
                                              (context, allChatsIndex) {
                                            final allChatsItem =
                                                allChats[allChatsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: StreamBuilder<FFChatInfo>(
                                                stream: FFChatManager.instance
                                                    .getChatInfo(
                                                        chatRecord:
                                                            allChatsItem),
                                                builder: (context, snapshot) {
                                                  final chatInfo = snapshot
                                                          .data ??
                                                      FFChatInfo(allChatsItem);
                                                  return FFChatPreview(
                                                    onTap: () =>
                                                        context.pushNamed(
                                                      'chatDetails',
                                                      queryParameters: {
                                                        'chatUser':
                                                            serializeParam(
                                                          chatInfo.otherUsers
                                                                      .length ==
                                                                  1
                                                              ? chatInfo
                                                                  .otherUsersList
                                                                  .first
                                                              : null,
                                                          ParamType.Document,
                                                        ),
                                                        'chatRef':
                                                            serializeParam(
                                                          chatInfo.chatRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'chatUser': chatInfo
                                                                    .otherUsers
                                                                    .length ==
                                                                1
                                                            ? chatInfo
                                                                .otherUsersList
                                                                .first
                                                            : null,
                                                      },
                                                    ),
                                                    lastChatText: chatInfo
                                                        .chatPreviewMessage(),
                                                    lastChatTime: allChatsItem
                                                        .lastMessageTime,
                                                    seen: allChatsItem
                                                        .lastMessageSeenBy!
                                                        .contains(
                                                            currentUserReference),
                                                    title: chatInfo
                                                        .chatPreviewTitle(),
                                                    userProfilePic: chatInfo
                                                        .chatPreviewPic(),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    unreadColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    titleTextStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                    ),
                                                    dateTextStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16.0,
                                                    ),
                                                    previewTextStyle:
                                                        GoogleFonts.getFont(
                                                      'Roboto',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14.0,
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 10.0,
                                                                8.0, 10.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
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
      },
    );
  }
}
