part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletUpdated extends WalletState {

  WalletUpdated({required this.totalSalary, required this.remainingAmount});
  final num remainingAmount;
  final num totalSalary;
}

class WalletError extends WalletState {

  WalletError({required this.message});
  final String message;
}
