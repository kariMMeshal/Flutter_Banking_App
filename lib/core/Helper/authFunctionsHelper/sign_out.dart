import 'package:banking_app2/features/OnBoarding/presentation/views/onboarding_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignOut {
  SignOut._();

  static void logOut(context) async {
    GoogleSignIn? googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();

    print("======= You are Signed Out  ========");
    GoRouter.of(context).push(OnBoardingView.route);
  }
}
