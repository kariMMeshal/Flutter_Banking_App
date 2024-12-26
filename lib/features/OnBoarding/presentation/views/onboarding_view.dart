import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/onboarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static String route = '/onBoardingView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: OnboardingViewBody(),
      ),
    );
  }
}
