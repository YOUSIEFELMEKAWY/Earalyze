import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class SettingsContainer extends StatelessWidget {
  final String sName;
  final String option;
  final VoidCallback onTap;
  final IconData icon;
  const SettingsContainer(
      {super.key,
      required this.sName,
      required this.option,
      required this.onTap,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppPreferences.isDarkMode()
              ? ColorManager.blackLight
              : ColorManager.blackDarkMode,
          size: context.width * 0.075,
        ),
        const SizedBox(width: 8),
        Text(sName, style: Theme.of(context).textTheme.bodySmall),
        InkWell(
          onTap: onTap,
          child: Text(option, style: Theme.of(context).textTheme.bodySmall),
        ),
      ],
    );
  }
}
