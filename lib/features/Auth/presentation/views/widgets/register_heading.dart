

import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:flutter/material.dart';

class RegisterHeading extends StatelessWidget {
  const RegisterHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        spacing: 10,
        children: [
          Text("Welcome To", style: Styles.ktextStyle16),
          Image.asset("assets/images/KWallet.png", height: 40),
          Text("Create Account", style: Styles.ktextStyle20),
          Text(
            "Your phone has been registered\nEnter the below details to continue",
            style: Styles.ktextStyle16.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
