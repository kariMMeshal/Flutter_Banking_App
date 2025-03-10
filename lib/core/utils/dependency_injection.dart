import 'package:banking_app2/core/networking/api_service.dart';
import 'package:banking_app2/core/networking/dio_factory.dart';
import 'package:banking_app2/features/Auth/data/repos/auth_repo.dart';
import 'package:banking_app2/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/CreditCards/data/repos/credit_card_repo.dart';
import 'package:banking_app2/features/CreditCards/data/repos/credit_card_repo_impl.dart';
import 'package:banking_app2/features/CreditCards/presentation/manager/CreditCards-bloc/creditcards_bloc.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

// this is the [ Dependency Injection ] class

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  Dio dio = DioFactory.getDio();
  locator.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Register FirebaseAuth as a lazy singleton
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register AuthRepoImpl and inject FirebaseAuth instance
  locator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuth: locator.get<FirebaseAuth>()));

  locator.registerFactory<AuthBloc>(() => AuthBloc(locator.get<AuthRepo>()));

  locator.registerFactory<WalletCubit>(
      () => WalletCubit(locator.get<FirebaseAuth>()));

  locator.registerLazySingleton<CreditCardRepo>(
    () => CreditCardRepoImpl(),
  );

  locator.registerFactory<CreditcardsBloc>(
    () => CreditcardsBloc(locator.get<CreditCardRepo>()),
  );
}
