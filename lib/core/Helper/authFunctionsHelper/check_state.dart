import 'package:firebase_auth/firebase_auth.dart';

class CheckState {
  CheckState._(); 

  /// Listens to authentication state changes and logs the current state.
  static void monitorAuthState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('===== User is currently signed out! =====');
      } else {
        print('===== User is signed in! =====');
      }
    });
  }

  /// Checks if the user is signed in and if their email is verified.
  static Future<bool> isUserSignedIn() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print("Email Verified: ${user.emailVerified}");
      return user.emailVerified;
    }
    return false; // Not signed in
  }
}


// class CheckState {
//   static Future<bool> isUserSignedIn() async {
//     User? user = FirebaseAuth.instance.currentUser;

//     // Check if the user is signed in
//     if (user != null) {
//       // Check if the user's email is verified
//       return user.emailVerified;
//     }
//     return false; // Not signed in
//   }
// }
