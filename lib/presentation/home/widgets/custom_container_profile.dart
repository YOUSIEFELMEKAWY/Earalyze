import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class CustomContainerProfile extends StatelessWidget {
  final String title;
  const CustomContainerProfile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            borderRadius: BorderRadius.only(
              bottomRight: isArabic()
                  ? const Radius.circular(0)
                  : const Radius.circular(15),
              bottomLeft: isArabic()
                  ? const Radius.circular(15)
                  : const Radius.circular(0),
            ),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.whiteLight
                    : ColorManager.whiteLight),
          ),
        ),
      ],
    );
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
