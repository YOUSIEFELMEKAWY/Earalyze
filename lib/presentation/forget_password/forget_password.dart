import 'package:earalyze/presentation/forget_password/cubits/forget_password_cubit.dart';
import 'package:earalyze/presentation/forget_password/cubits/forget_password_states.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_source/local/app_preferences.dart';
import '../../generated/l10n.dart';
import '../common_widgets/custom_elevated_button.dart';
import '../common_widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppPreferences.isDarkMode()
          ? ColorManager.whiteLight
          : ColorManager.whiteDarkMode,
      appBar: AppBar(
        title: Text(
          S.of(context).forgetPassword,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: context.width * 0.065,
              color: AppPreferences.isDarkMode()
                  ? ColorManager.primaryDarkLight
                  : ColorManager.primaryDarkDarkMode),
        ),
        backgroundColor: AppPreferences.isDarkMode()
            ? ColorManager.whiteLight
            : ColorManager.whiteDarkMode,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(),
        child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  S.of(context).checkEmail,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: context.height * 0.028),
                ),
                SizedBox(
                  height: context.height * 0.015,
                ),
                Text(
                  S.of(context).messageForCheckEmail,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: context.height * 0.024,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: context.height * 0.03,
                ),
                Form(
                  key: formKey,
                  child: CustomTextFormField(
                    hintText: S.of(context).enterYourEmail,
                    labelText: S.of(context).email,
                    isPassword: false,
                    onChanged: (data) {
                      email = data;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Enter a valid email (e.g., user@example.com)';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                CustomElevatedButton(
                  isLoading: context.read<ForgetPasswordCubit>().isLoading,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<ForgetPasswordCubit>()
                          .sendPasswordResetEmail(
                              context: context, email: email!);
                    }
                  },
                  name: S.of(context).signIn,
                  width: context.width * 0.9,
                  fontSize: context.height * 0.02,
                  buttonColor: AppPreferences.isDarkMode()
                      ? ColorManager.primaryLight
                      : ColorManager.primaryDarkMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
