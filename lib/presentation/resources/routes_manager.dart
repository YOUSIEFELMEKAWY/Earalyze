import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import '../login/login_view.dart';
import '../onboarding1/view/onboarding_view.dart';
import '../splash/splash_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String onboardingRoute = '/onboarding';
  static const String mainRoute = '/main';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(
            builder: (context) => const OnboardingView1());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRoute),
        ),
        body: const Center(child: Text(AppStrings.noRoute)),
      ),
    );
  }
}
