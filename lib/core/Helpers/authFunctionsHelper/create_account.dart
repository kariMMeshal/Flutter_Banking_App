import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> createAccount({
  required String emailAddress,
  required String password,
  required String username,
  required String birthDate,
  required String phoneNumber,
  required String city,
}) async {
  // Create user with email and password
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    'birthDate': birthDate,
    'phoneNumber': phoneNumber,
    'city': city,
    'createdAt': FieldValue.serverTimestamp(), // Account creation time
  });
}
