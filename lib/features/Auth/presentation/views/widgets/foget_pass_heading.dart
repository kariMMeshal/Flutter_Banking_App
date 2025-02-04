import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class ForgetPassHeading extends StatelessWidget {
  const ForgetPassHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(
        spacing: 10,
        children: [
          const Text('Welcome To', style: Styles.ktextStyle16),
          Image.asset('assets/images/KWallet.png', height: 40),
          const Text('Sign in', style: Styles.ktextStyle20),
          Text(
            'Enter Your mail',
            style: Styles.ktextStyle16.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
