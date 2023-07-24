import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddServiceModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for category widget.
  String? categoryValue;
  FormFieldController<String>? categoryValueController;
  // State field(s) for service_name widget.
  TextEditingController? serviceNameController;
  String? Function(BuildContext, String?)? serviceNameControllerValidator;
  // State field(s) for service_price widget.
  TextEditingController? servicePriceController;
  String? Function(BuildContext, String?)? servicePriceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    serviceNameController?.dispose();
    servicePriceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
