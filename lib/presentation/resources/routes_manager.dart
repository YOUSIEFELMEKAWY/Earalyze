import 'package:earalyze/presentation/home/home_view.dart';
import 'package:earalyze/presentation/resources/constants_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../login/login_view.dart';
import '../onBoarding/onboarding_view.dart';
import '../signup/signup_view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String onboardingRoute = '/onboarding';
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static List<GetPage> getPages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginView(),
      transition: Transition.rightToLeft,
      transitionDuration:
          const Duration(milliseconds: AppConstants.transitionDuration),
    ),
    GetPage(
      name: Routes.signupRoute,
      page: () => const SignupView(),
      transition: Transition.rightToLeft,
      transitionDuration:
          const Duration(milliseconds: AppConstants.transitionDuration),
    ),
    GetPage(
      name: Routes.onboardingRoute,
      page: () => const OnboardingView(),
      transition: Transition.leftToRight,
      transitionDuration:
          const Duration(milliseconds: AppConstants.transitionDuration),
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomeView(),
      transition: Transition.leftToRight,
      transitionDuration:
      const Duration(milliseconds: AppConstants.transitionDuration),
    ),
  ];
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.noRoute),
      ),
      body: const Center(child: Text(AppStrings.noRoute)),
    ),
  );
}
