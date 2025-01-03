import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  SplashViewBodyState createState() => SplashViewBodyState();
}

class SplashViewBodyState extends State<SplashViewBody> {
  double _dimension = 150;
  bool _isScaledUp = false;

  @override
  void initState() {
    super.initState();
    _startScalingAnimation();
    _navigateAfterAnimation();
  }

  void _startScalingAnimation() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dimension = _isScaledUp ? 150 : 190;
        _isScaledUp = !_isScaledUp;
      });
    });
  }

  void _navigateAfterAnimation() async {
    await Future.delayed(Duration(seconds: 3)); // Wait for 3 seconds

    try {
      bool isSignedIn = await _checkIfUserIsSignedIn();

      if (mounted) {
        if (isSignedIn) {
          GoRouter.of(context).go(HomeView.route);
        } else {
          GoRouter.of(context).go(OnBoardingView.route);
        }
      }
    } catch (e) {
      if (mounted) {
        GoRouter.of(context).go(OnBoardingView.route); // Fallback to onboarding
      }
    }
  }

  Future<bool> _checkIfUserIsSignedIn() async {
    try {
      FirebaseAuth firebaseAuth = locator.get<FirebaseAuth>();
      User? user = firebaseAuth.currentUser;
      return user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedContainer(
              width: _dimension,
              height: _dimension,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Image.asset("assets/images/money.png"),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                height: 30,
                child: Image.asset("assets/images/KWallet.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
