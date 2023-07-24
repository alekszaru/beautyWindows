import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginPhoneModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for phone widget.
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '+38# ## ### ####');
  String? Function(BuildContext, String?)? phoneControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    phoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
