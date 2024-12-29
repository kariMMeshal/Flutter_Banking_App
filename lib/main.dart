import 'package:banking_app2/core/utils/app_router.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await initializeApp();

  runApp(BankingApp());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await setupLocator(); // Set up GetIt dependency injection.
  await Firebase.initializeApp(); 
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized()); // Preserve splash screen.
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
