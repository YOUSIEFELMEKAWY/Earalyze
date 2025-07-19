import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String name;
  final MainAxisAlignment mainAxisAlignment;
  final TextStyle? textStyle;
  const CustomTextWidget(
      {super.key,
      required this.name,
      required this.mainAxisAlignment,
      required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          name,
          style: textStyle,
        ),
      ],
    );
  }
}
