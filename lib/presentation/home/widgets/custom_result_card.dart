import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class CustomResultCard extends StatelessWidget {
  final String title;
  final String message;
  final double width;
  final double fontSize1;
  final double fontSize2;

  const CustomResultCard(
      {super.key,
      required this.title,
      required this.message,
      required this.width,
      required this.fontSize1,
      required this.fontSize2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.primaryLight
                    : ColorManager.primaryDarkMode,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: fontSize1,
                    color: AppPreferences.isDarkMode()
                        ? ColorManager.whiteLight
                        : ColorManager.whiteLight),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: fontSize2,
                    color: AppPreferences.isDarkMode()
                        ? ColorManager.primaryDarkLight
                        : ColorManager.grey2Light),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
