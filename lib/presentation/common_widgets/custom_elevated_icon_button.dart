import 'package:flutter/material.dart';

import '../../data/data_source/local/app_preferences.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class CustomElevatedIconButton extends StatelessWidget {
  final double width;
  final String name;
  final String imageName;
  final VoidCallback onPressed;
  const CustomElevatedIconButton(
      {super.key,
      required this.width,
      required this.name,
      required this.imageName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        imageName,
        width: width * 0.12,
        height: 24.0,
      ),
      label: Text(name,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppPreferences.isDarkMode()
                  ? ColorManager.whiteLight
                  : ColorManager.whiteLight)),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPreferences.isDarkMode()
            ? ColorManager.primaryLight
            : ColorManager.primaryDarkMode,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30),
        ),
        padding: const EdgeInsets.symmetric(
            vertical: AppSize.s10, horizontal: AppSize.s16),
      ),
    );
  }
}
