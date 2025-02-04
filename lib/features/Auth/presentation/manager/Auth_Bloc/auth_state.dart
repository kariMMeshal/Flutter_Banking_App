part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {

  LoginSuccess({required this.userName});
  final String userName;
}

final class LoginFailure extends AuthState {

  LoginFailure({required this.errorMessage});
  final String errorMessage;
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {

  RegisterSuccess({required this.userName});
  final String userName;
}

final class RegisterFailure extends AuthState {
  RegisterFailure({required this.errorMessage});
  final String errorMessage;
}

final class ResetPassLoading extends AuthState {}

final class ResetPassSuccess extends AuthState {}

final class ResetPassFailure extends AuthState {
  ResetPassFailure({required this.errorMessage});
  final String errorMessage;
}
