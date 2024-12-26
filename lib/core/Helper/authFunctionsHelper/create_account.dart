import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:banking_app2/core/common/widgets/custom_dialog.dart';
import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class CreateAccount {
  CreateAccount._();

  static void createAccount(
    context, {
    required String emailAddress,
    required String password,
    required String username,
    required DateTime birthDate,
    required String phoneNumber,
    required String city,
  }) async {
    try {
      // Create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      // Set displayName (username)
      await credential.user!.updateDisplayName(username);

      // Send email verification
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();

      // Save additional user details in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'username': username,
        'birthDate': birthDate.toIso8601String(),
        'phoneNumber': phoneNumber,
        'city': city,
        'createdAt': FieldValue.serverTimestamp(), // Account creation time
      });

      // Show success dialog
      CustomDialog(
        context: context,
        title: "Verification",
        message:
            'A verification email has been sent to your email. Please verify and then login.',
        dialogType: DialogType.info,
        btnOkOnPress: () {
          GoRouter.of(context).push(HomeView.route);
        },
      ).customDialog();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog(
          context: context,
          title: "Error",
          message: 'The password provided is too weak.',
          dialogType: DialogType.error,
        ).customDialog();
      } else if (e.code == 'email-already-in-use') {
        CustomDialog(
          context: context,
          title: "Error",
          message: 'The account already exists for that email.',
          dialogType: DialogType.error,
        ).customDialog();
      }
    } catch (e) {
      CustomDialog(
        context: context,
        title: "Error",
        message: 'An unexpected error occurred: $e',
        dialogType: DialogType.error,
      ).customDialog();
    }
  }
}
