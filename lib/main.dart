import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:banking_app2/banking_app.dart';
import 'package:banking_app2/core/Helpers/notification_helper.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await initializeNotifications(); // 🔹 تم استبدال `requestNotificationPermission` بوظيفة أكثر شمولًا
  await setupLocator();

  String? userId = FirebaseAuth.instance.currentUser?.uid;
  if (userId != null) {
    NotificationHelper(userId);
  }
  FlutterNativeSplash.remove();

  runApp(const BankingApp());
}

Future<void> initializeNotifications() async {
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic alerts',
        defaultColor: kPurple,
        ledColor: Colors.white,
        importance: NotificationImportance.High,
        channelShowBadge: true,
      )
    ],
    debug: true,
  );

  bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowed) {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
}
