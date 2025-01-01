part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletUpdated extends WalletState {
  final num remainingAmount;
  final num totalSalary;

  WalletUpdated({required this.totalSalary, required this.remainingAmount});
}

class WalletError extends WalletState {
  final String message;

  WalletError({required this.message});
}
