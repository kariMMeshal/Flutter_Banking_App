import 'package:banking_app2/core/errors/failures.dart';
import 'package:banking_app2/features/Auth/data/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either<Failures, User>> createAccount({
    required String emailAddress,
    required String password,
    required String username,
    required String birthDate,
    required String phoneNumber,
    required String city,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Save additional user details in Firestore
      await credential.user!.updateDisplayName(username);

      // Send email verification
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'username': username,
        'birthDate': birthDate,
        'phoneNumber': phoneNumber,
        'city': city,
        'createdAt': FieldValue.serverTimestamp(), // Account creation time
      });
      await credential.user!.reload();
      final updatedUser = _firebaseAuth.currentUser;

      return Right(updatedUser!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailures.forRegister(e));
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failures, User>> signIn({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      final user = userCredential.user;

      // Check if the user's email is verified
      if (user != null && !user.emailVerified) {
        return Left(AuthFailures.forSignIn(
            FirebaseAuthException(code: 'email-not-verified')));
      }

      return Right(user!);
    } on FirebaseAuthException catch (e) {
      return Left(AuthFailures.forSignIn(e));
    }
  }

///////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failures, bool>> resetPassword(
      {required String emailAddress}) async {
    try {
      final signInMethods =
          // ignore: deprecated_member_use
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(emailAddress);

      if (signInMethods.isEmpty) {
        return Left(AuthFailures('No user found with this email address.'));
      }

      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      return Left(
        AuthFailures.forSignIn(e),
      ); // Reuse the `AuthFailures` class for errors.
    }
  }
}
