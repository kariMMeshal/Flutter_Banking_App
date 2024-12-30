import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String route = "/homeView";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBackground,
        body: const HomeViewBody(),
      ),
    );
  }
}
