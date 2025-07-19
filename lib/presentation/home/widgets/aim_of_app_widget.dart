import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';

class AimOfAppWidget extends StatelessWidget {
  const AimOfAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.196,
      decoration: BoxDecoration(
        color: AppPreferences.isDarkMode()
            ? ColorManager.whiteLight
            : ColorManager.primaryLight,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppPreferences.isDarkMode()
                ? ColorManager.grayLight.withOpacity(0.4)
                : ColorManager.grayDarkMode,
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Text(
        S.of(context).aimOfApp,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontSize: context.width * 0.037,
              color: AppPreferences.isDarkMode()
                  ? ColorManager.primaryLight.withOpacity(0.9)
                  : ColorManager.whiteLight.withOpacity(0.9),
            ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
