import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/buildpage_widget.dart';
import 'package:flutter/material.dart';

class BoardingPageView extends StatelessWidget {
  const BoardingPageView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        BuildPage(
          imgUrl: "assets/images/9462114.jpg",
          title: "One",
          subTitle: "",
        ),
        BuildPage(
          imgUrl: "assets/images/2869279.jpg",
          title: "Two",
          subTitle: "",
        ),
        BuildPage(
          imgUrl: "assets/images/3286556.jpg",
          title: "Three",
          subTitle: "",
        ),
      ],
    );
  }
}
