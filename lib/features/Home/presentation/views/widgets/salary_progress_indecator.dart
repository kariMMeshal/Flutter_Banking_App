import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SalaryProgressIndicator extends StatelessWidget {
  final num totalSalary;
  final num remainingSalary;

  const SalaryProgressIndicator({
    super.key,
    required this.totalSalary,
    required this.remainingSalary,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = remainingSalary / totalSalary;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return CircularPercentIndicator(
          progressColor: Color.lerp(kBlue, kPurple, progress)!,
          radius: 100,
          lineWidth: 10,
          percent: value,
          backgroundColor: Colors.grey[200]!,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${(value * totalSalary).toStringAsFixed(2)}',
                style: Styles.ktextStyle24,
              ),
              Text(
                'of \$${totalSalary.toStringAsFixed(2)}',
                style: Styles.ktextStyle16.copyWith(color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}
