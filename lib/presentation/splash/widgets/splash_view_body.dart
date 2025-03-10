import 'package:earalyze/presentation/login/login_view.dart';
import 'package:earalyze/presentation/resources/constants_manager.dart';
import 'package:earalyze/presentation/splash/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../onBoarding/onboarding_view.dart';
import '../../resources/assets_manager.dart';

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
    checkOnboardingStatus();
  }

  Future<void> checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

    // Navigate based on onboarding status
    if (onboardingCompleted) {
      navigateToLogin(); // Navigate to home
    } else {
      navigateToOnboarding(); // Navigate to onboarding
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
        SidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: const Offset(0, 9))
            .animate(animationController);
    animationController.forward();
  }

  void navigateToOnboarding() {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Get.off(() => const OnboardingView(),
          transition: Transition.fade,
          duration: const Duration(seconds: AppConstants.transitionDuration));
    });
  }

  void navigateToLogin() {
    Future.delayed(const Duration(seconds: AppConstants.splashDelay), () {
      Get.off(() => const LoginView(),
          transition: Transition.fade,
          duration: const Duration(seconds: AppConstants.transitionDuration));
    });
  }
}
