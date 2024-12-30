import 'dart:math';

import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SalaryProgressIndicator extends StatefulWidget {
  final double totalSalary;
  final double remainingSalary;

  const SalaryProgressIndicator({
    super.key,
    required this.totalSalary,
    required this.remainingSalary,
  });

  @override
  State<SalaryProgressIndicator> createState() =>
      _SalaryProgressIndicatorState();
}

class _SalaryProgressIndicatorState extends State<SalaryProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation = Tween<double>(
            begin: 0, end: widget.remainingSalary / widget.totalSalary)
        .animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SalaryProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.remainingSalary != widget.remainingSalary ||
        oldWidget.totalSalary != widget.totalSalary) {
      _controller.reset();
      _animation = Tween<double>(
              begin: 0, end: widget.remainingSalary / widget.totalSalary)
          .animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double progress = _animation.value;
        if (progress < 0) progress = 0;
        if (progress > 1) progress = 1;

        return SizedBox(
          width: 200,
          height: 200,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: _CircularProgressPainter(progress),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '\$${(progress * widget.totalSalary).toStringAsFixed(2)}',
                      style: Styles.ktextStyle24),
                  Text(
                    'of \$${widget.totalSalary.toStringAsFixed(2)}',
                    style: Styles.ktextStyle16.copyWith(color: kborder),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double progress;

  _CircularProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10; // Adjust for stroke width

    final backgroundPaint = Paint()
      ..color = Colors.grey[200]!
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        // Gradient for the progress
        colors: [kBlue,kPurple],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded ends

    canvas.drawCircle(center, radius, backgroundPaint);

    final angle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
