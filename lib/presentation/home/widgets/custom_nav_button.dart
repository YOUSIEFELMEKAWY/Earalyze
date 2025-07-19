import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';

class CustomNavButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const CustomNavButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: AppPreferences.isDarkMode()
            ? ColorManager.primaryLight
            : ColorManager.primaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.whiteLight,
          ),
        ),
        elevation: 4,
      ),
      child: SizedBox(
        width: context.width * 0.19,
        height: context.height * 0.058,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 18,
                color: AppPreferences.isDarkMode()
                    ? ColorManager.whiteLight
                    : ColorManager.whiteDarkMode),
            SizedBox(height: context.height * 0.005),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: context.width * 0.034,
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.whiteLight
                      : ColorManager.whiteLight),
            ),
          ],
        ),
      ),
    );
  }
}
