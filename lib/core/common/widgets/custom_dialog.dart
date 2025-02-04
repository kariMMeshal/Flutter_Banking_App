import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


Future<dynamic> customDialog({
  required BuildContext context,
  required String message,
  required String title,
  required DialogType dialogType,
  VoidCallback? btnOkOnPress,
  VoidCallback? btnCancelOnPress,
  String? btnOkText,
  String? btnCancelText,
}) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.bottomSlide,
    title: title,
    desc: message,
    btnCancelOnPress: btnCancelOnPress,
    btnOkOnPress: btnOkOnPress,
    btnOkText: btnOkText ?? 'Okay',
    btnCancelText: btnCancelText ?? 'Cancel',
  ).show();
}
