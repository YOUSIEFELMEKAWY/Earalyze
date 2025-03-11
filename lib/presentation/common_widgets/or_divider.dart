import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: AppSize.s3,
            color: ColorManager.primary,
            endIndent: AppSize.s20,
          ),
        ),
         Text(
          AppStrings.or,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
         Expanded(
          child: Divider(
            thickness: AppSize.s3,
            color: ColorManager.primary,
            indent: AppSize.s20,
          ),
        ),
      ],
    );
  }
}
