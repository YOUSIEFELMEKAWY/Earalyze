import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

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
      builder: (context, child) =>  SlideTransition(
        position: slidingAnimation,
        child: Center(
          child: Text(
            AppStrings.appDesc,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}