import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class SalaryProgressIndicator extends StatelessWidget {
  const SalaryProgressIndicator({
    super.key,
    required this.totalSalary,
    required this.remainingSalary,
  });
  final num totalSalary;
  final num remainingSalary;

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
            Color.lerp(kRed, kYellow, value),
            Color.lerp(kYellow, kGreen, value),
            value,
          ),
          radius: 90,
          lineWidth: 8,
          percent: value,
          backgroundColor: Colors.grey[200]!,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$${(value * totalSalary).toStringAsFixed(2)}',
                style: Styles.ktextStyle20,
              ),
              Text(
                'of \$${totalSalary.toStringAsFixed(2)}',
                style: Styles.ktextStyle14.copyWith(color: Colors.grey),
              ),
              Text(
                isExceeded
                    ? '+ \$${(remainingSalary - totalSalary).toStringAsFixed(2)}'
                    : '',
                style: Styles.ktextStyle12.copyWith(color: kGreen),
              ),
            ],
          ),
        );
      },
    );
  }
}
