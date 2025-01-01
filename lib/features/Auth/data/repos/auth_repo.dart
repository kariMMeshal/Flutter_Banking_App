import 'package:banking_app2/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failures, User>> createAccount({
    required String emailAddress,
    required String password,
    required String username,
    required String birthDate,
    required String phoneNumber,
    required String city,
    required num totalSalary,
    required num reminingSalary,
  });
  Future<Either<Failures, User>> signIn({
    required String emailAddress,
    required String password,
  });

  Future<Either<Failures, bool>> resetPassword({
    required String emailAddress,
  });
}
