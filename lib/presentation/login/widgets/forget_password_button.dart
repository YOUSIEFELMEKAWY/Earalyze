import 'package:flutter/material.dart';

import '../../resources/strings_manager.dart';

class ForgetPasswordButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ForgetPasswordButton({super.key,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.forgetPassword,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
