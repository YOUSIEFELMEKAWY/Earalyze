import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/local/app_preferences.dart';
import '../resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final String name;
  final bool isLoading;
  final double fontSize;
  final Color buttonColor;
  const CustomElevatedButton(
      {super.key,
      required this.width,
      required this.onPressed,
      required this.name,
      required this.isLoading,
      required this.fontSize,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30),
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppSize.s16, horizontal: width * 0.39),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.whiteLight
                    : ColorManager.whiteLight,
                strokeWidth: 2.0,
              ),
            )
          : Text(
              name,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: fontSize,
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.whiteLight
                      : ColorManager.whiteLight),
            ),
    );
  }
}
