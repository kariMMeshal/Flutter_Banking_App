import 'package:banking_app2/core/utils/app_router.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/CreditCards/presentation/manager/CreditCards-bloc/creditcards_bloc.dart';
import 'package:banking_app2/features/Home/presentation/manager/BottomNav_Cubit/bottom_nav_cubit.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator.get<WalletCubit>()..fetchSalary(),
        ),
        BlocProvider(create: (context) => BottomNavCubit()),
        BlocProvider(
          create: (context) =>
              locator.get<CreditcardsBloc>()..add(LoadCardsEvent()),
        ),
        BlocProvider(create: (context) => locator.get<AuthBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: klightBackground,
          textTheme:
              GoogleFonts.poppinsTextTheme((ThemeData.light().textTheme)),
        ),
      ),
    );
  }
}
