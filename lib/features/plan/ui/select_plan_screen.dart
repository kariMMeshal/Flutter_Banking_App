import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/core/common/widgets/custom_button.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/features/plan/ui/widgets/customized_plan_screen.dart';
import 'package:banking_app2/features/plan/ui/widgets/plan_cards_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SelectPlanScreen extends StatelessWidget {
  const SelectPlanScreen({super.key});
  static const String route = '/planScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text("Choose Your Plan", style: Styles.ktextStyle24),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const PlanCardsSlider(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: CustomButton(
                width: MediaQuery.of(context).size.width,
                title: "Customize Your Own Plan Now !",
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Ready to make the best plan!!",
                            style: Styles.ktextStyle20,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Let AI help you make the best plan that suits you!",
                            style: Styles.ktextStyle16,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                height: 80,
                                contentPadding: const EdgeInsets.all(15),
                                backgroundColor: kBlue,
                                title:
                                    "Take a Surviey to help Ai find the best plan for you 🤖",
                                onPressed: () => GoRouter.of(context)
                                    .go(CustomizedPlanScreen.route),
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                  contentPadding: const EdgeInsets.all(10),
                                  height: 100,
                                  backgroundColor: kPurple,
                                  title: "PREMIUM",
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return DraggableScrollableSheet(
                                          initialChildSize: 0.4,
                                          minChildSize: 0.3,
                                          maxChildSize: 0.6,
                                          expand: false,
                                          builder: (context, scrollController) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            20)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 10,
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                              ),
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    "Subscription Plan to Let Ai anlyse your last transactions and learn your spending hapits to find what satisfies you the most",
                                                    style: Styles.ktextStyle20,
                                                  ),
                                                  const SizedBox(height: 10),
                                                  const Text(
                                                    "\$9.99/month",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kLightBlue,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  CustomButton(
                                                    title: "Subscribe Now ",
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    backgroundColor: kBlue,
                                                    onPressed: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                          title: const Text(
                                                              "Stay Tuned!",
                                                              style: Styles
                                                                  .ktextStyle20),
                                                          content: const Text(
                                                            "This feature will be available soon. 🚀",
                                                            style: Styles
                                                                .ktextStyle16,
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      context),
                                                              child: const Text(
                                                                  "OK"),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
