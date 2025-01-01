import 'package:banking_app2/core/utils/app_router.dart';
import 'package:banking_app2/core/utils/constants.dart';
import 'package:banking_app2/core/utils/dependency_injection.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  FlutterNativeSplash.remove();

  runApp(BankingApp());
}

Future<void> initializeApp() async {
  await Firebase.initializeApp();
  await Future.delayed(Duration(seconds: 2));
  await setupLocator(); // Set up GetIt dependency injection.
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<WalletCubit>()..fetchSalary(),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: klightBackground,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.light().textTheme),
        ),
      ),
    );
  }
}
