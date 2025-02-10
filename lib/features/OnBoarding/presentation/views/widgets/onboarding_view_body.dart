import 'package:banking_app2/core/Helpers/sharedprefs_helper.dart';
import 'package:banking_app2/core/common/styles/styles.dart';
import 'package:banking_app2/features/Auth/presentation/views/register_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/widgets/buildpage_widget.dart';
import 'package:banking_app2/core/common/widgets/custom_icon_button.dart';
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
        const Text('Welcome To ',
            style: Styles.ktextStyle20, textAlign: TextAlign.center),
        Image.asset('assets/images/KWallet.png', height: 40),
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: const [
              BuildPage(
                title: 'Welcome to KWallet',
                subTitle: 'your best banking app',
                imgUrl: 'assets/images/9462114.jpg',
              ),
              BuildPage(
                title: 'Credit Cards Managemnet',
                imgUrl: 'assets/images/Illustration2.png',
              ),
              BuildPage(
                title: 'Control your Money Flow & Transactions',
                imgUrl: 'assets/images/Group3.png',
              ),
              BuildPage(
                title: 'Get Started Now',
                imgUrl: 'assets/images/Launching.gif',
              ),
            ],
          ),
        ),
        CustomPageIndicator(controller: controller),
        const SizedBox(height: 6),
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
                    duration: const Duration(milliseconds: 200),
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
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  void getStarted() async {
    await SharedPrefsHelper.saveBool('ShowHome', true);
    if (mounted) {
      GoRouter.of(context).push(RegisterView.route);
    }
  }
}
