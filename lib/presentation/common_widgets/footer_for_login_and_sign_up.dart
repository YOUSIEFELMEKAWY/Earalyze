import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class FooterForLoginAndSignUp extends StatelessWidget {
  final double width;
  final String questionText;
  final String actionText;
  final VoidCallback onTap;
  const FooterForLoginAndSignUp(
      {super.key,
      required this.width,
      required this.questionText,
      required this.actionText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.15,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        color: ColorManager.primaryDark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s30),
          topRight: Radius.circular(AppSize.s30),
        ),
      ),
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: questionText,
          style: Theme.of(context).textTheme.displaySmall,
          children: [
            TextSpan(
              text: actionText,
              style: Theme.of(context).textTheme.displayMedium,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
