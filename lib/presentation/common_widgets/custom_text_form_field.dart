import 'package:earalyze/presentation/common_widgets/cubits/show_password/show_password_cubit.dart';
import 'package:earalyze/presentation/common_widgets/cubits/show_password/show_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../resources/color_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final Function(String)? onChanged;
  const CustomTextFormField(
      {super.key,
        required this.onChanged,
      required this.hintText,
      required this.labelText,
      required this.isPassword,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowPasswordCubit>(
      create: (context) => ShowPasswordCubit(),
      child: BlocBuilder<ShowPasswordCubit,ShowPasswordState>(
        builder: (context, state) =>  TextFormField(
          validator: (data)
          {
            if (data!.isEmpty) {
              return 'This field is required';
            }
          },
          onChanged: onChanged,
          obscureText: isPassword ? state.defaultShowPassword : false,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            labelText: labelText, // Add label here
            labelStyle: TextStyle(color: ColorManager.primary),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 2.0),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorManager.grey1),
            suffixIcon: isPassword ? IconButton(
              icon: Icon(
                state.defaultShowPassword ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.grey1,
              ),
              onPressed: () {
                context.read<ShowPasswordCubit>().togglePasswordVisibility();
              },
            ): null,
          ),
        ),
      ),
    );
  }
}
