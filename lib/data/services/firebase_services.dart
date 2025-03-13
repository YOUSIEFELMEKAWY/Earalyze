import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../presentation/common_widgets/custom_snack_bar.dart';
import '../../presentation/resources/routes_manager.dart';

class FirebaseServices {


  Future<void> signupUser(context, String email, String password) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await user.user!.sendEmailVerification();

      customSnackBar(context, "Sign up successful! Please check your email to verify your account.",
          backgroundColor: Colors.lightGreen, icon: Icons.check);
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case 'weak-password':
          customSnackBar(context, "The password provided is too weak.");
          break;
        case 'email-already-in-use':
          customSnackBar(context, "The account already exists for that email.");
          break;
        case 'invalid-email':
          customSnackBar(context, "The email address is invalid.");
          break;
        case 'operation-not-allowed':
          customSnackBar(context, "Email/password accounts are not enabled.");
          break;
        default:
          customSnackBar(context, "An unknown Firebase error occurred: ${ex.message}");
      }
    } on FirebaseException catch (ex) {
      customSnackBar(context, "Firebase error: ${ex.message}");
    } catch (ex) {
      customSnackBar(context, "An unexpected error occurred: $ex");
    }
  }


  Future<void> signInUser(context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user!.emailVerified) {
        customSnackBar(context, "Sign in Success",
            backgroundColor: Colors.lightGreen, icon: Icons.check);
        Get.offNamed(Routes.homeRoute); // Navigate to home screen
      } else {
        await FirebaseAuth.instance.signOut();
        customSnackBar(context, "Please verify your email to sign in.",
            backgroundColor: Colors.orange, icon: Icons.warning);


        await userCredential.user!.sendEmailVerification();
        customSnackBar(context, "A new verification email has been sent.",
            backgroundColor: Colors.blue, icon: Icons.email);
      }
    } on FirebaseAuthException catch (ex) {

      switch (ex.code) {
        case 'user-not-found':
          customSnackBar(context, "No user found for that email.");
          break;
        case 'wrong-password':
          customSnackBar(context, "Wrong password provided for that user.");
          break;
        case 'invalid-email':
          customSnackBar(context, "The email address is invalid.");
          break;
        case 'user-disabled':
          customSnackBar(context, "This user account has been disabled.");
          break;
        case 'too-many-requests':
          customSnackBar(context, "Too many requests. Try again later.");
          break;
        default:
          customSnackBar(context, "An unknown Firebase error occurred: ${ex.message}");
      }
    } on FirebaseException catch (ex) {
      customSnackBar(context, "Firebase error: ${ex.message}");
    } catch (ex) {
      customSnackBar(context, "An unexpected error occurred: $ex");
    }
  }
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // User canceled the sign-in process
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      // Successfully signed in
      print("Signed in with Google: ${userCredential.user!.email}");
    } on FirebaseAuthException catch (ex) {
      print("Firebase Auth Error: ${ex.message}");
    } catch (ex) {
      print("Error: $ex");
    }
  }
}
