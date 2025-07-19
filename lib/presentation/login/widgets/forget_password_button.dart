import 'package:flutter/material.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';

class ForgetPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ForgetPasswordButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          S.of(context).forgetPassword,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppPreferences.isDarkMode()
                  ? ColorManager.primaryDarkLight
                  : ColorManager.whiteLight),
        ),
      ),
    );
  }
}
