import 'package:banking_app2/core/common/styles/styles.dart';
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
    // Calculate progress, ensuring it's between 0 and 1
    final double progress =
        totalSalary > 0 ? (remainingSalary / totalSalary).clamp(0, 1) : 0;
    bool isExceeded = false;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: progress),
      duration: const Duration(milliseconds: 1200),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        if (remainingSalary > totalSalary) {
          isExceeded = true;
        }
        return CircularPercentIndicator(
          progressColor: Color.lerp(
            Color.lerp(Colors.red.shade800, Colors.yellow.shade600, value)!,
            Color.lerp(Colors.yellow.shade600, Colors.green.shade600, value)!,
            value,
          )!,
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
              Text(
                isExceeded
                    ? '+ \$${(remainingSalary - totalSalary).toStringAsFixed(2)}'
                    : "",
                style: Styles.ktextStyle16.copyWith(color: Colors.green),
              ),
            ],
          ),
        );
      },
    );
  }
}
