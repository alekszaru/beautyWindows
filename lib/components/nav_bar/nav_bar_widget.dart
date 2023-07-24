import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  _NavBarWidgetState createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

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

    return Container(
      width: double.infinity,
      height: 75.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 0.0),
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FlutterFlowIconButton(
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.home,
                  color: FFAppState().currentPageIndex == 0
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().currentPageIndex = 0;
                  });
                  if (valueOrDefault<bool>(
                          currentUserDocument?.isMaster, false) ==
                      true) {
                    context.pushNamed('mainPageMaster');
                  } else {
                    context.pushNamed('mainPageClient');
                  }
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: FaIcon(
                  FontAwesomeIcons.listUl,
                  color: FFAppState().currentPageIndex == 2
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  if (valueOrDefault<bool>(
                          currentUserDocument?.isMaster, false) ==
                      true) {
                    context.pushNamed('appointmentsListMaster');
                  } else {
                    context.pushNamed('appointmentsListClient');
                  }

                  setState(() {
                    FFAppState().currentPageIndex = 2;
                  });
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: FaIcon(
                  FontAwesomeIcons.users,
                  color: FFAppState().currentPageIndex == 3
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().currentPageIndex = 3;
                  });
                  if (valueOrDefault<bool>(
                          currentUserDocument?.isMaster, false) ==
                      true) {
                    context.pushNamed('clientsList');
                  } else {
                    context.pushNamed('mastersList');
                  }
                },
              ),
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 50.0,
                icon: Icon(
                  Icons.chat,
                  color: FFAppState().currentPageIndex == 1
                      ? FlutterFlowTheme.of(context).accent1
                      : FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  setState(() {
                    FFAppState().currentPageIndex = 1;
                  });

                  context.pushNamed('chatMain');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
