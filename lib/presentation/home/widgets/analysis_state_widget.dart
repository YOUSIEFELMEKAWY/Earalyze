import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class AnalysisStateWidget extends StatelessWidget {
  final String label;
  final int number;
  const AnalysisStateWidget(
      {super.key, required this.label, required this.number});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.4,
      child: Card(
        color: AppPreferences.isDarkMode()
            ? ColorManager.whiteLight
            : ColorManager.primaryLight,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.whiteLight,
          ),
        ),
        elevation: 0,
        margin: const EdgeInsets.all(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                number.toString(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.primaryDarkLight
                          : ColorManager.whiteLight,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: context.width * 0.04,
                    color: AppPreferences.isDarkMode()
                        ? ColorManager.primaryLight
                        : ColorManager.whiteLight),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
