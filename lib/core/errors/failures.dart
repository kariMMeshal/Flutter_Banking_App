import 'package:firebase_auth/firebase_auth.dart';

abstract class Failures {
  const Failures(this.errorMessage);
  final String errorMessage;
}

// Authentication Failures
class AuthFailures extends Failures {
  const AuthFailures(super.errorMessage);

  // Sign-in Failures
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
        errorMessage =
            'Invalid Credential (email or password). Please try again.';
    }

    return AuthFailures(errorMessage);
  }

  // Registration Failures
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
// Sign-out Failures
  factory AuthFailures.forSignOut(Exception exception) {
    String errorMessage;

    if (exception is FirebaseAuthException) {
      switch (exception.code) {
        case 'network-request-failed':
          errorMessage = 'Network error. Please check your connection.';
          break;
        case 'user-token-expired':
          errorMessage = 'Your session has expired. Please sign in again.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many sign-out attempts. Try again later.';
          break;
        default:
          errorMessage = 'An error occurred while signing out. Try again.';
      }
    } else {
      errorMessage = 'An unexpected error occurred while signing out.';
    }

    return AuthFailures(errorMessage);
  }
}

// Database Failures
class DatabaseFailures extends Failures {
  const DatabaseFailures(super.errorMessage);

  // Factory method to handle different database errors
  factory DatabaseFailures.fromException(Exception exception) {
    String errorMessage;

    if (exception.toString().contains("UNIQUE constraint failed")) {
      errorMessage = "This card already exists in the database.";
    } else if (exception.toString().contains("no such table")) {
      errorMessage = "Database table not found. Please initialize correctly.";
    } else if (exception.toString().contains("database is locked")) {
      errorMessage = "Database is locked. Please retry the operation later.";
    } else if (exception.toString().contains("syntax error")) {
      errorMessage = "A database syntax error occurred.";
    } else {
      errorMessage = "An unexpected database error occurred.";
    }

    return DatabaseFailures(errorMessage);
  }
}
