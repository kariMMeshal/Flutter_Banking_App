import 'package:banking_app2/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  FlutterNativeSplash.remove();

  runApp(BankingApp());
}

Future<void> initializeApp() async {
  await Firebase.initializeApp();
  await Future.delayed(Duration(seconds: 2));
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
