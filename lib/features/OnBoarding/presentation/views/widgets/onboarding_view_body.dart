import 'package:banking_app2/core/Helpers/sharedprefs_helper.dart';
import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/Auth/presentation/views/login_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/buildpage_widget.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/custom_icon_button.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/custom_page_indicator.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/onboarding_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  OnboardingViewBodyState createState() => OnboardingViewBodyState();
}

class OnboardingViewBodyState extends State<OnboardingViewBody> {
  final controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingAppbar(onSkipTap: skipToLastPage),
        Text("Welcome To ",
            style: Styles.ktextStyle20, textAlign: TextAlign.center),
        Image.asset("assets/images/KWallet.png", height: 40),
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              BuildPage(
                title: "Welcome to KWallet",
                imgUrl: "assets/images/9462114.jpg",
              ),
              BuildPage(
                title: "Financial Services",
                imgUrl: "assets/images/2869279.jpg",
              ),
              BuildPage(
                title: "Secure Money Transaction",
                imgUrl: "assets/images/test1.jpg",
              ),
              BuildPage(
                title: "Get Started Now",
                imgUrl: "assets/images/4198074.jpg",
              ),
            ],
          ),
        ),
        CustomPageIndicator(controller: controller),
        SizedBox(height: 6),
        currentIndex == 3
            ? CustomIconButton(
                iconData: Icons.check,
                ontap: getStarted,
              )
            : CustomIconButton(
                iconData: Icons.arrow_forward_ios,
                ontap: () {
                  controller.animateToPage(
                    currentIndex + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                },
              ),
      ],
    );
  }

  void skipToLastPage() {
    controller.animateToPage(
      3,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void getStarted() async {
    await SharedPrefsHelper.saveBool("ShowHome", true);
    if (mounted) {
      GoRouter.of(context).push(LoginView.route);
    }
  }
}
