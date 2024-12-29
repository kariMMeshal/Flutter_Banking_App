import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/Auth/presentation/views/widgets/forget_pass_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static String route = '/forgetPasswordView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: klightBackground,
        body: ForgetPassBody(),
      ),
    );
  }
}
