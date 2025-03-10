import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/home_appbar_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeCustomAppbar extends StatelessWidget {
  const HomeCustomAppbar({super.key, required this.currentBalance});
  final num currentBalance;
  @override
  Widget build(BuildContext context) {
    final user = locator.get<FirebaseAuth>().currentUser;
    final displayName = user?.displayName ?? 'User';
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: kShadedBlue,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBarIcons(),
              Text(
                'Welcome Back',
                style: Styles.ktextStyle18.copyWith(color: Colors.white),
              ),
              Text(
                displayName,
                style: Styles.ktextStyle20.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                'Current Balance : ',
                style: Styles.ktextStyle18.copyWith(color: Colors.white),
              ),
              Text(
                '\$${currentBalance.toStringAsFixed(2)}',
                style: Styles.ktextStyle24.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          right: -50,
          top: 50,
          child: SizedBox(
            height: 150,
            child: Image.asset('assets/images/lot-money-icon.png'),
          ),
        ),
      ],
    );
  }
}
