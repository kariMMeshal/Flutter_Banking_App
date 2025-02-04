import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String route = '/registerView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: klightBackground,
      body: RegisterViewBody(),
    ));
  }
}
