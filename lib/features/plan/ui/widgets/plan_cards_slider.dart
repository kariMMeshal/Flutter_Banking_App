
import 'package:banking_app2/features/plan/ui/widgets/plan_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PlanCardsSlider extends StatelessWidget {
  const PlanCardsSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .65,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: const [
        PlanCard(
          title: "Extreme Mode",
          description: "Track & save your money efficiently.",
          backgroundImage: "assets/images/ninja.jpg",
        ),
        PlanCard(
          title: "Professional\nSpender",
          description: "Strategies to grow your wealth.",
          backgroundImage: "assets/images/profissinal.jpg",
        ),
        PlanCard(
          title: "Spoiled Baby",
          description: "Plan to pay off debts effectively.",
          backgroundImage: "assets/images/spoiled.jpg",
        ),
      ],
    );
  }
}
