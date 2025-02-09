// ignore_for_file: use_build_context_synchronously

import 'package:banking_app2/core/common/widgets/alert_dialog.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:banking_app2/features/Profile/presentation/views/widgets/custom_profile_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignOutSuccess) {
          GoRouter.of(context).go(OnBoardingView.route);
        } else if (state is SignOutFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 30),
          SizedBox(height: 150, child: Image.asset('assets/images/money.png')),
          const SizedBox(height: 50),
          CustomProfileListtile(
            ontap: () {},
            iconData: Icons.history,
            title: "History",
          ),
          CustomProfileListtile(
            ontap: () {},
            iconData: Icons.settings,
            title: "Settings",
          ),
          CustomProfileListtile(
            ontap: () async {
              bool? confirmed = await showConfirmationDialog(
                context,
                title: "Confirm Action",
                content: "Are you sure you want to sign out from this account?",
              );
              if (confirmed == true) {
                context.read<AuthBloc>().add(SignOutEvent());
                Restart.restartApp();
              }
            },
            iconData: Icons.logout_rounded,
            title: "Sign Out",
          ),
        ],
      ),
    );
  }
}
