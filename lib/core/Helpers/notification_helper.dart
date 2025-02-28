import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationHelper {
  final String uid;
  double? _lastRemainingPercentage;
  double? _lastRemainingAmount;

  NotificationHelper(this.uid) {
    debugPrint("🔍 NotificationHelper initialized for user: $uid");
    _startListening();
  }

  void _startListening() {
    debugPrint("📡 Listening for balance updates...");

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .snapshots()
        .listen((doc) {
      if (!doc.exists) {
        debugPrint("⚠ No document found for user: $uid");
        return;
      }

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      double remainingAmount = data['remainingAmount']?.toDouble() ?? 0;
      double totalSalary =
          data['totalSalary']?.toDouble() ?? 1; // Avoid division by zero
      double remainingPercentage = (remainingAmount / totalSalary) * 100;
      String? message;

      // 🔄 Check if amount increased or decreased
      if (_lastRemainingAmount != null) {
        if (remainingAmount > _lastRemainingAmount!) {
          message =
              "⬆ Amount INCREASED: ${_lastRemainingAmount!} ➝ $remainingAmount (+${(remainingAmount - _lastRemainingAmount!).toStringAsFixed(2)})";
        } else if (remainingAmount < _lastRemainingAmount!) {
          message =
              "⬆ Amount DECREASED: ${_lastRemainingAmount!} ➝ $remainingAmount (+${(remainingAmount - _lastRemainingAmount!).toStringAsFixed(2)})";
        }
      }

      if (remainingAmount < 100) {
        message = "Your remaining balance is under 100 EGP.";
      } else if (remainingPercentage < 25) {
        message = "Your remaining balance is less than 25% of your salary.";
      } else if (remainingPercentage < 50) {
        message = "Your remaining balance is less than 50% of your salary.";
      } else if (remainingPercentage < 80) {
        message = "Your remaining balance is less than 80% of your salary.";
      }

      bool notify = false;
      if (_lastRemainingPercentage == null || _lastRemainingAmount == null) {
        notify = message != null;
      } else {
        if ((remainingAmount < 100 && _lastRemainingAmount! >= 100) ||
            (remainingAmount >= 100 && _lastRemainingAmount! < 100) ||
            (remainingPercentage < 25 && _lastRemainingPercentage! >= 25) ||
            (remainingPercentage >= 25 && _lastRemainingPercentage! < 25) ||
            (remainingPercentage < 50 && _lastRemainingPercentage! >= 50) ||
            (remainingPercentage >= 50 && _lastRemainingPercentage! < 50) ||
            (remainingPercentage < 80 && _lastRemainingPercentage! >= 80) ||
            (remainingPercentage >= 80 && _lastRemainingPercentage! < 80) ||
            ((_lastRemainingAmount! - remainingAmount).abs() >= 5)) {
          notify = true;
        }
      }

      _lastRemainingPercentage = remainingPercentage;
      _lastRemainingAmount = remainingAmount;

      if (notify && message != null) {
        debugPrint("✅ Sending notification: $message");
        sendLocalNotification("Wallet Alert", message);
      } else {
        debugPrint("ℹ No notification sent - No threshold crossed.");
      }
    });
  }

  void sendLocalNotification(String title, String body) {
    debugPrint("📢 Creating notification: $title - $body");

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
        wakeUpScreen: true,
        autoDismissible: true,
        category: NotificationCategory.Reminder,
      ),
    );
  }
}
