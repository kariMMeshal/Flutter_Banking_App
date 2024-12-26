import 'package:banking_app2/core/Helper/styles.dart';
import 'package:flutter/material.dart';

class OnboardingAppbar extends StatelessWidget {
  const OnboardingAppbar({super.key, required this.onSkipTap});

  final Function onSkipTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.language, size: 28),
                Text(" English ", style: Styles.ktextStyle16),
              ],
            ),
          ),
          TextButton(
              onPressed: () => onSkipTap(),
              child: Text(
                "Skip",
                style: Styles.ktextStyle16,
              ))
        ],
      ),
    );
  }
}
