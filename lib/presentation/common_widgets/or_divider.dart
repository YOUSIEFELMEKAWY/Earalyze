import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../../generated/l10n.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: AppSize.s3,
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.grayLight,
            endIndent: AppSize.s20,
          ),
        ),
        Text(
          S.of(context).or,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: context.height * 0.015,
              color: AppPreferences.isDarkMode()
                  ? ColorManager.primaryDarkLight
                  : ColorManager.grayLight),
        ),
        Expanded(
          child: Divider(
            thickness: AppSize.s3,
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.grayLight,
            indent: AppSize.s20,
          ),
        ),
      ],
    );
  }
}
