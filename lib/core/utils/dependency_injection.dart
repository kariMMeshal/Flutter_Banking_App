import 'package:banking_app2/features/Auth/data/repos/auth_repo.dart';
import 'package:banking_app2/features/Auth/data/repos/auth_repo_impl.dart';
import 'package:banking_app2/features/Auth/presentation/manager/Auth_Bloc/auth_bloc.dart';
import 'package:banking_app2/features/Home/presentation/manager/Wallet_Cubit/wallet_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

// this is the [ Dependency Injection ] class

final GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  // Register FirebaseAuth as a lazy singleton
  locator.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register AuthRepoImpl and inject FirebaseAuth instance
  locator.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(firebaseAuth: locator.get<FirebaseAuth>()));

  locator.registerFactory<AuthBloc>(() => AuthBloc(locator.get<AuthRepo>()));

  locator.registerFactory<WalletCubit>(
      () => WalletCubit(locator.get<FirebaseAuth>()));
}
