import 'package:banking_app2/features/Auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String route = '/loginView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfffbfbfb),
        body: LoginViewBody(),
      ),
    );
  }
}
