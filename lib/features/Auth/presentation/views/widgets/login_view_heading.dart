import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class LoginViewHeading extends StatelessWidget {
  const LoginViewHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        spacing: 10,
        children: [
          Text("Welcome To", style: Styles.ktextStyle16),
          Image.asset("assets/images/KWallet.png", height: 40),
          Text("Sign in", style: Styles.ktextStyle20),
          Text(
            "Please sign in to continue",
            style: Styles.ktextStyle16.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
