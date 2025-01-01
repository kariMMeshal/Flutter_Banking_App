part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class RegisterEvent extends AuthEvent {
  final String emailAddress;
  final String password;
  final String username;
  final String city;
  final String phoneNumber;
  final String birthDate;
  final num salary;

  RegisterEvent({
    required this.salary,
    required this.emailAddress,
    required this.password,
    required this.username,
    required this.city,
    required this.phoneNumber,
    required this.birthDate,
  });
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent({required this.email, required this.password});
}

final class ResetPassEvent extends AuthEvent {
  final String email;

  ResetPassEvent({required this.email});
}
