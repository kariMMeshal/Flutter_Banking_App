// // ignore_for_file: unused_local_variable, use_build_context_synchronously
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:banking_app2/core/Helpers/authFunctionsHelper/check_state.dart';
// import 'package:banking_app2/core/common/widgets/custom_dialog.dart';
// import 'package:banking_app2/features/Home/presentation/views/home_view.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// class UserSignIn {
//   UserSignIn._();

//   static Future<void> signIn(BuildContext context,
//       {required String emailAddress, required String password}) async {
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: emailAddress.trim().toLowerCase(),
//         password: password.trim(),
//       );
//       bool isVerified = await CheckState.isUserSignedIn();

//       // Only navigate if sign-in was successful.
//       if (isVerified) {
//         GoRouter.of(context).pushReplacement(HomeView.route);
//       } else {
//         CustomDialog(
//           context: context,
//           message: "Please check your email",
//           title: "Not Valid",
//           dialogType: DialogType.error,
//         ).customDialog();
//       }
//     } on FirebaseAuthException catch (e) {
//       await Future.delayed(const Duration(seconds: 3));
//       String errorMessage;
//       switch (e.code) {
//         case 'user-not-found':
//           errorMessage = 'No user found for that email.';
//           break;
//         case 'wrong-password':
//           errorMessage = 'Wrong password provided for that user.';
//           break;
//         case 'invalid-email':
//           errorMessage = 'The email address is not valid.';
//           break;
//         case 'user-disabled':
//           errorMessage =
//               'The user corresponding to the email has been disabled.';
//           break;
//         case 'operation-not-allowed':
//           errorMessage = 'Email/password accounts are not enabled.';
//           break;
//         case 'invalid-credential':
//           errorMessage = 'Invalid - Credential\nWrong Email or Password';
//           break;
//         case 'too-many-requests':
//           errorMessage =
//               'Too many requests from this device. Please try again later.';
//           break;
//         default:
//           errorMessage = 'An unknown error occurred.';
//         // print(e.code);
//       }

//       CustomDialog(
//               context: context,
//               message: errorMessage,
//               title: "Something wrong happened please try again later :/ ",
//               dialogType: DialogType.error)
//           .customDialog();
//     }
//   }
// }
