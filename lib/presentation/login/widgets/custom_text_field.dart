import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  const CustomTextField({super.key, required this.hintText, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodySmall, // Typing text color
      decoration: InputDecoration(
        labelText: labelText, // Add label here
        labelStyle: TextStyle(color: ColorManager.primary), // Label text color
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: Colors.grey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(color: ColorManager.primary, width: 2.0),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: ColorManager.grey1), // Hint text color
      ),
    );

  }
}
