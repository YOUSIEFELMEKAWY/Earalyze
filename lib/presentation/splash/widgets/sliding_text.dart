import 'package:flutter/material.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';

class SidingText extends StatelessWidget {
  const SidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, child) => SlideTransition(
        position: slidingAnimation,
        child: Center(
          child: Text(
            S.of(context).appDesc,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.whiteLight
                    : ColorManager.whiteLight),
          ),
        ),
      ),
    );
  }
}
