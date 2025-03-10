import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String route = '/onboardingView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: klightBackground,
        body: OnboardingViewBody(),
      ),
    );
  }
}
