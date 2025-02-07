import 'package:flutter/material.dart';

Future<void> customSnackBar(BuildContext context,
    {required String title,
    int durationInSeconds = 5,
    Color color = Colors.black}) async {
  await ScaffoldMessenger.of(context)
      .showSnackBar(
        SnackBar(
          content: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: color,
          duration: Duration(seconds: durationInSeconds),
          dismissDirection: DismissDirection.horizontal,
        ),
      )
      .closed;
}
