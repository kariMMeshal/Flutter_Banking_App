part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class RegisterEvent extends AuthEvent {

  RegisterEvent({
    required this.salary,
    required this.emailAddress,
    required this.password,
    required this.username,
    required this.city,
    required this.phoneNumber,
    required this.birthDate,
  });
  final String emailAddress;
  final String password;
  final String username;
  final String city;
  final String phoneNumber;
  final String birthDate;
  final num salary;
}

final class LoginEvent extends AuthEvent {
  LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}

final class ResetPassEvent extends AuthEvent {

  ResetPassEvent({required this.email});
  final String email;
}
