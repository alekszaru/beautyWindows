import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CompleteProfilePhoneAuthModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for isMaster widget.
  bool? isMasterValue;
  // State field(s) for displayName widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  String? _displayNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for yourCity widget.
  final yourCityKey = GlobalKey();
  TextEditingController? yourCityController;
  String? yourCitySelectedOption;
  String? Function(BuildContext, String?)? yourCityControllerValidator;
  String? _yourCityControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }
    if (val != yourCitySelectedOption) {
      return 'Please choose an option from the dropdown';
    }
    if (val.length < 3) {
      return 'Введіть хоча б 3 літери';
    }

    return null;
  }

  // State field(s) for bio widget.
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    displayNameControllerValidator = _displayNameControllerValidator;
    yourCityControllerValidator = _yourCityControllerValidator;
  }

  void dispose() {
    displayNameController?.dispose();
    bioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
