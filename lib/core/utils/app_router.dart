import 'package:banking_app2/core/Helpers/sharedprefs_helper.dart';
import 'package:banking_app2/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
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
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: OnBoardingView.route,
        builder: (context, state) => OnBoardingView(),
      ),
      GoRoute(
          path: LoginView.route,
          builder: (context, state) => BlocProvider(
                create: (context) => AuthBloc(AuthRepoImpl()),
                child: LoginView(),
              )),
      GoRoute(
        path: RegisterView.route,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthBloc(AuthRepoImpl()),
          child: RegisterView(),
        ),
      ),
    ],
  );
}
