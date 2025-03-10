import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';

class AppLogo extends StatelessWidget {
  final double width;
  const AppLogo({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.48,
      child: Image.asset(ImageAssets.splashLogo),
    );
  }
}
