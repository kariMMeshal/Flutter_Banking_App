import 'package:banking_app2/core/Helper/sharedprefs_helper.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {

  static Future<bool> isLoggedIn() async {
    final bool showHome = await SharedPrefsHelper.getBool("ShowHome") ?? false;
    return showHome;
  }

  static final router = GoRouter(
    
    initialLocation: '/',
    redirect: (context, state) async =>
        await isLoggedIn() ? HomeView.route : OnBoardingView.route,
    routes: [
      GoRoute(
        path: HomeView.route,
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: OnBoardingView.route,
        builder: (context, state) => OnBoardingView(),
      ),
    ],
  );
}
