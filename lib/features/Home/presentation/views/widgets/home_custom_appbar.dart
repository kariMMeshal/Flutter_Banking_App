import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Home/presentation/views/widgets/appbar_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeCustomAppbar extends StatelessWidget {
  const HomeCustomAppbar({super.key, required this.currentBalance});
  final num currentBalance;
  @override
  Widget build(BuildContext context) {
    final user = locator.get<FirebaseAuth>().currentUser;
    final displayName = user?.displayName ?? "User";
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: kPurple,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarIcons(),
              Text(
                "Welcome Back",
                style: Styles.ktextStyle18.copyWith(color: Colors.white),
              ),
              Text(
                displayName,
                style: Styles.ktextStyle20.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "Current Balance : ",
                style: Styles.ktextStyle18.copyWith(color: Colors.white),
              ),
              Text(
                "\$${currentBalance.toStringAsFixed(2)}",
                style: Styles.ktextStyle24.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Positioned(
          right: -50, // Adjust position from the right
          top: 50, // Adjust position from the top
          child: SizedBox(
            height: 150,
            child: Image.asset("assets/images/lot-money-icon.png"),
          ),
        ),
      ],
    );
  }
}
