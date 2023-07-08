import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar1_model.dart';
export 'nav_bar1_model.dart';

class NavBar1Widget extends StatefulWidget {
  const NavBar1Widget({Key? key}) : super(key: key);

  @override
  _NavBar1WidgetState createState() => _NavBar1WidgetState();
}

class _NavBar1WidgetState extends State<NavBar1Widget> {
  late NavBar1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBar1Model());

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
        color: Color(0x00EEEEEE),
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
                  Icons.apps,
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
                icon: Icon(
                  Icons.chat_outlined,
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
            ],
          ),
        ],
      ),
    );
  }
}
