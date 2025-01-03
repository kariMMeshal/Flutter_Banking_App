part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final String userName;

  LoginSuccess({required this.userName});
}

final class LoginFailure extends AuthState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final String userName;

  RegisterSuccess({required this.userName});
}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

final class ResetPassLoading extends AuthState {}

final class ResetPassSuccess extends AuthState {}

final class ResetPassFailure extends AuthState {
  final String errorMessage;
  ResetPassFailure({required this.errorMessage});
}
