import 'package:earalyze/presentation/common_widgets/cubits/show_password/show_password_cubit.dart';
import 'package:earalyze/presentation/common_widgets/cubits/show_password/show_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowPasswordCubit>(
      create: (context) => ShowPasswordCubit(),
      child: BlocBuilder<ShowPasswordCubit, ShowPasswordState>(
        builder: (context, state) => TextFormField(
          validator: validator,
          onChanged: onChanged,
          obscureText: isPassword ? state.defaultShowPassword : false,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.primaryLight
                    : ColorManager.whiteLight),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.grey1Light
                      : ColorManager.grey1DarkMode,
                  width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.primaryLight
                      : ColorManager.primaryDarkMode,
                  width: 2.0),
            ),
            errorStyle: const TextStyle(
              color: Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.grey1Light
                    : ColorManager.grey1DarkMode),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      state.defaultShowPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.grey1Light
                          : ColorManager.grey1DarkMode,
                    ),
                    onPressed: () {
                      context
                          .read<ShowPasswordCubit>()
                          .togglePasswordVisibility();
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
