import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context,
    {required String title, int durationInSeconds = 5}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(25)),
      content: Text(title, style: Styles.ktextStyle16),
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
