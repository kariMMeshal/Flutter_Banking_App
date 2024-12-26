import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String route = "/homeView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBackground,
        body: Center(child: Text("Home Page ")),
      ),
    );
  }
}
