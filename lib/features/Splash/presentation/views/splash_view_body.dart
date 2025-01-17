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
  double _dimension = 140;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startScalingAnimation();
    _navigateAfterAnimation();
  }

  void _startScalingAnimation() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _dimension = _dimension == 140 ? 160 : 140;
        });
      }
    });
  }

  void _navigateAfterAnimation() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    try {
      final isSignedIn = await _checkIfUserIsSignedIn();
      if (!mounted) return;

      final route = isSignedIn ? HomeView.route : OnBoardingView.route;
      GoRouter.of(context).go(route);
    } catch (e) {
      if (!mounted) return;
      GoRouter.of(context).go(OnBoardingView.route); // Fallback to onboarding
    }
  }

  Future<bool> _checkIfUserIsSignedIn() async {
    try {
      final firebaseAuth = locator.get<FirebaseAuth>();
      return firebaseAuth.currentUser != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    _timer
        ?.cancel(); // Cancel the timer to avoid calling setState() after dispose
    super.dispose();
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
              duration: const Duration(milliseconds: 800),
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
