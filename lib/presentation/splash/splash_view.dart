import 'package:earalyze/presentation/splash/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import '../resources/color_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const SplashViewBody(),
    );
  }
}
