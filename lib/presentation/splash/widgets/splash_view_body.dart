import 'package:earalyze/presentation/resources/constants_manager.dart';
import 'package:earalyze/presentation/splash/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import '../../resources/assets_manager.dart';
import '../../resources/routes_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    checkOnboardingAndAuthStatus(); // Check both onboarding and auth status
  }

  Future<void> checkOnboardingAndAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

    if (!onboardingCompleted) {
      // Navigate to onboarding if not completed
      navigateToOnboarding();
    } else {
      // Check authentication status if onboarding is completed
      checkAuthStatus();
    }
  }

  Future<void> checkAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Check if the user logged in via Facebook or another provider
      bool isFacebookUser = false;

      for (final provider in user.providerData) {
        if (provider.providerId == 'facebook.com') {
          isFacebookUser = true;
          break;
        }
      }

      // For Facebook users, skip email verification check
      if (isFacebookUser || user.emailVerified) {
        navigateToHome(user);
      } else {
        await FirebaseAuth.instance.signOut();
        navigateToLogin();
      }
    } else {
      navigateToLogin();
    }
  }


  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Image(image: AssetImage(ImageAssets.splashLogo)),
        SidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 9), end: const Offset(0, 7))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Get.offAllNamed(Routes.onboardingRoute);
    });
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Get.offAllNamed(Routes.loginRoute);
    });
  }

  void navigateToHome(User user) {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Get.offAllNamed(
        Routes.homeRoute,
        arguments: user,
      );
    });
  }

}