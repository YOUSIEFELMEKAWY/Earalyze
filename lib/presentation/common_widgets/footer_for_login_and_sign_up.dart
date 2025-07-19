import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../data/data_source/local/app_preferences.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class FooterForLoginAndSignUp extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onTap;
  const FooterForLoginAndSignUp(
      {super.key,
      required this.questionText,
      required this.actionText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.width * 0.15,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: AppPreferences.isDarkMode()
            ? ColorManager.primaryDarkLight
            : ColorManager.primaryDarkMode,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s30),
          topRight: Radius.circular(AppSize.s30),
        ),
      ),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: questionText,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: AppPreferences.isDarkMode()
                  ? ColorManager.whiteLight
                  : ColorManager.whiteLight),
          children: [
            TextSpan(
              text: actionText,
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.whiteLight
                      : ColorManager.whiteLight),
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
