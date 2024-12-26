import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context,
    {required String title, int durationInSeconds = 3}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title, style: Styles.ktextStyle16),
      duration: Duration(seconds: durationInSeconds),
      backgroundColor: Colors.deepOrange,
      behavior: SnackBarBehavior.floating,
    ),
  );
}
