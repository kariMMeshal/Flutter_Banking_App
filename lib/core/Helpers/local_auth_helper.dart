import 'package:local_auth/local_auth.dart';

class AuthHelper {
  static final LocalAuthentication _auth = LocalAuthentication();

  static Future<bool> authenticateUser() async {
    try {
      bool authenticated = await _auth.authenticate(
        localizedReason: "Authenticate to reveal card details",
        options:
            const AuthenticationOptions(biometricOnly: true, stickyAuth: true),
      );
      return authenticated;
    } catch (e) {
      // print("Authentication error: $e");
      return false;
    }
  }
}
