import 'package:banking_app2/features/Profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String route = '/profileView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: ProfileViewBody(),
    ));
  }
}
