import 'package:firebase_auth/firebase_auth.dart';

abstract class Failures {
  final String errorMessage;
  const Failures(this.errorMessage);
}

class AuthFailures extends Failures {
  const AuthFailures(super.errorMessage);

  // Sign in Failures
  factory AuthFailures.forSignIn(FirebaseAuthException exception) {
    String errorMessage;

    switch (exception.code) {
      case 'email-not-verified':
        errorMessage = 'Please verify your email address before signing in.';
        break;
      case 'user-not-found':
        errorMessage = 'No user found for this email address.';
        break;
      case 'wrong-password':
        errorMessage = 'The password entered is incorrect.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is invalid. Please try again.';
        break;
      case 'too-many-requests':
        errorMessage = 'Too many attempts. Please try again later.';
        break;
      default:
        errorMessage = 'Invalid Credintial (email or Password)\n Please try again.';
    }

    return AuthFailures(errorMessage);
  }

  /// Registration exceptions
  factory AuthFailures.forRegister(FirebaseAuthException exception) {
    String errorMessage;
    switch (exception.code) {
      case 'email-already-in-use':
        errorMessage =
            'This email address is already in use by another account.';
        break;
      case 'weak-password':
        errorMessage =
            'The password is too weak. Please choose a stronger password.';
        break;
      case 'invalid-email':
        errorMessage = 'The email address is invalid. Please try again.';
        break;
      case 'operation-not-allowed':
        errorMessage =
            'Email/password accounts are not enabled. Contact support.';
        break;
      default:
        errorMessage = 'An unknown error occurred during registration.';
    }
    return AuthFailures(errorMessage);
  }
}
