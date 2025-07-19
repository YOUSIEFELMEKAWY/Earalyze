import 'package:earalyze/presentation/splash/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../resources/color_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPreferences.isDarkMode()
          ? ColorManager.primaryLight
          : ColorManager.primaryDarkMode,
      body: const SplashViewBody(),
    );
  }
}
