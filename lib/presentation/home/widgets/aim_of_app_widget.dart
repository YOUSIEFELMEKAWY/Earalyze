import 'package:earalyze/app/app.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';

class AimOfAppWidget extends StatelessWidget {
  const AimOfAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.196,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: ColorManager.gray.withOpacity(0.4),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20.0),
      child: Text(
        AppStrings.aimOfApp,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontSize: context.width * 0.037,
          color: ColorManager.primary.withOpacity(0.9),
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
