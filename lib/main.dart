import 'package:banking_app2/core/Helper/sharedprefs_helper.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool showHome = await SharedPrefsHelper.getBool("showHome") ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.showHome});

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showHome ? HomeView() : OnBoardingView(),
    );
  }
}
