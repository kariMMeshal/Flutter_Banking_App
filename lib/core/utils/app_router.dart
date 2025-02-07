import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Auth/presentation/views/forget_password_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/login_view.dart';
import 'package:banking_app2/features/Auth/presentation/views/register_view.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/add_cards_view.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:banking_app2/features/Splash/presentation/views/splash_view.dart';
import 'package:banking_app2/features/CreditCards/presentation/views/credit_cards_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: SplashView.route,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: HomeView.route,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: AddCardView.route,
        builder: (context, state) => const AddCardView(),
      ),
      GoRoute(
        path: CreditCardsView.route,
        builder: (context, state) => const CreditCardsView(),
      ),
      GoRoute(
        path: OnBoardingView.route,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
          path: LoginView.route,
          builder: (context, state) => BlocProvider(
                create: (context) => locator.get<AuthBloc>(),
                child: const LoginView(),
              )),
      GoRoute(
        path: RegisterView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => locator.get<AuthBloc>(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: ForgetPasswordView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => locator.get<AuthBloc>(),
          child: const ForgetPasswordView(),
        ),
      ),
    ],
  );
}
