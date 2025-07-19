import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class ScanPageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color color;
  const ScanPageButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 2,
      ),
      child: SizedBox(
        width: context.width * 0.3,
        height: context.height * 0.11,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                size: 25,
                color: AppPreferences.isDarkMode()
                    ? ColorManager.whiteLight
                    : ColorManager.whiteLight),
            SizedBox(height: context.height * 0.005),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: context.width * 0.039,
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
