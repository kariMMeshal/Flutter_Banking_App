import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      onDotClicked: (index) => controller.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.easeInOut),
      controller: controller,
      count: 4,
      effect: ExpandingDotsEffect(
        activeDotColor: Colors.deepPurple,
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 10,
      ),
    );
  }
}
