import 'package:banking_app2/core/Helpers/sharedprefs_helper.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Auth/presentation/views/forget_password_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/login_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/register_view.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static Future<bool> isLoggedIn() async {
    final bool showHome = await SharedPrefsHelper.getBool("ShowHome") ?? false;
    return showHome;
  }

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: HomeView.route,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: OnBoardingView.route,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
          path: LoginView.route,
          builder: (context, state) => BlocProvider(
                create: (context) => locator.get<AuthBloc>(),
                child: LoginView(),
              )),
      GoRoute(
        path: RegisterView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => locator.get<AuthBloc>(),
          child: RegisterView(),
        ),
      ),
      GoRoute(
        path: ForgetPasswordView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => locator.get<AuthBloc>(),
          child: ForgetPasswordView(),
        ),
      ),
    ],
  );
}
