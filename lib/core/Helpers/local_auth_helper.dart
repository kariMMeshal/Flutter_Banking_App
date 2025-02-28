import 'package:local_auth/local_auth.dart';

class LocalAuthHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  Future<bool> authenticateUser(
      {String reason = "Authenticate to proceed"}) async {
    try {
      bool isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return false;
      }

      bool isAuthenticated = await _auth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          biometricOnly: true, // Only use biometrics
          stickyAuth: true, // Keeps auth active while app is in background
          useErrorDialogs: true, // Show system error dialogs
        ),
      );

      return isAuthenticated;
    } catch (e) {
      return false;
    }
  }
}
