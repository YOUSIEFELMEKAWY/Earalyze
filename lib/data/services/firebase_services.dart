import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../presentation/common_widgets/custom_snack_bar.dart';
import '../../presentation/resources/routes_manager.dart';

class FirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Sign up with email and password
  Future<void> signupUser(context, String email, String password) async {
    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await user.user!.sendEmailVerification();

      customSnackBar(
        context,
        "Sign up successful! Please check your email to verify your account.",
        backgroundColor: Colors.lightGreen,
        icon: Icons.check,
      );

      // Navigate to login screen after successful sign-up
      Get.offNamed(Routes.loginRoute);
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

  // Sign in with email and password
  Future<void> signInUser(context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user!.emailVerified) {
        customSnackBar(
          context,
          "Sign in Success",
          backgroundColor: Colors.lightGreen,
          icon: Icons.check,
        );
        Get.offNamed(Routes.homeRoute,arguments: userCredential.user); // Navigate to home screen
      } else {
        await _auth.signOut();
        customSnackBar(
          context,
          "Please verify your email to sign in.",
          backgroundColor: Colors.orange,
          icon: Icons.warning,
        );

        await userCredential.user!.sendEmailVerification();
        customSnackBar(
          context,
          "A new verification email has been sent.",
          backgroundColor: Colors.blue,
          icon: Icons.email,
        );
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

  // Sign in with Google
  Future<void> signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        customSnackBar(
          context,
          "Google sign-in canceled.",
          backgroundColor: Colors.orange,
          icon: Icons.warning,
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      customSnackBar(
        context,
        "Signed in with Google: ${userCredential.user!.email}",
        backgroundColor: Colors.lightGreen,
        icon: Icons.check,
      );
      Get.offNamed(Routes.homeRoute,arguments: userCredential.user); // Navigate to home screen
    } on FirebaseAuthException catch (ex) {
      customSnackBar(
        context,
        "Firebase Auth Error: ${ex.message}",
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    } catch (ex) {
      customSnackBar(
        context,
        "Error: $ex",
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook(context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) {
        customSnackBar(
          context,
          "Facebook login failed: Access token is null",
          backgroundColor: Colors.red,
          icon: Icons.error,
        );
        return;
      }

      final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final UserCredential userCredential =
      await _auth.signInWithCredential(facebookAuthCredential);
      customSnackBar(
        context,
        "Signed in with Facebook",
        backgroundColor: Colors.lightGreen,
        icon: Icons.check,
      );
      Get.offNamed(Routes.homeRoute,arguments: userCredential.user); // Navigate to home screen
    } catch (e) {
      customSnackBar(
        context,
        "Error during Facebook login: $e",
        backgroundColor: Colors.red,
        icon: Icons.error,
      );
    }
  }
  // logout
  Future<void> logOut(context) async {
    await FirebaseAuth.instance.signOut();
    customSnackBar(
      context,
      "Log Out Successfully",
      backgroundColor: Colors.lightGreen,
      icon: Icons.check,
    );
    Get.offNamed(Routes.loginRoute); // Navigate to home screen
  }

}