import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final String name;
  const CustomElevatedButton(
      {super.key,
      required this.width,
      required this.onPressed,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primary, // Customize your color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s30), // Rounded corners
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppSize.s16, horizontal: width * 0.39),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
