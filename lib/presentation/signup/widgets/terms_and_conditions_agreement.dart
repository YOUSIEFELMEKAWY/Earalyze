import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../resources/color_manager.dart';

class TermsAndConditionsAgreement extends StatelessWidget {
  final VoidCallback launchTerms;
  final VoidCallback launchPrivacyPolicy;

  const TermsAndConditionsAgreement(
      {super.key,
      required this.launchTerms,
      required this.launchPrivacyPolicy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: 'By continuing, you agree to our ',
          style: TextStyle(
              color: AppPreferences.isDarkMode()
                  ? ColorManager.primaryLight
                  : ColorManager.whiteLight),
          children: [
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.blueLight
                    : ColorManager.blueDarkMode,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = launchTerms,
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.blueLight
                    : ColorManager.blueDarkMode,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = launchPrivacyPolicy,
            ),
          ],
        ),
      ),
    );
  }
}
