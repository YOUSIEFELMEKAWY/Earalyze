import 'package:earalyze/presentation/common_widgets/custom_elevated_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_elevated_icon_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_text_form_field.dart';
import 'package:earalyze/presentation/common_widgets/footer_for_login_and_sign_up.dart';
import 'package:earalyze/presentation/login/cubits/login_cubit.dart';
import 'package:earalyze/presentation/login/cubits/login_states.dart';
import 'package:earalyze/presentation/login/widgets/forget_password_button.dart';
import 'package:earalyze/presentation/common_widgets/or_divider.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../../data/services/firebase_services.dart';
import '../../generated/l10n.dart';
import '../common_widgets/custom_text_widget.dart';
import '../resources/routes_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    String? email;
    String? password;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context, state) => Scaffold(
          backgroundColor: AppPreferences.isDarkMode()
              ? ColorManager.whiteLight
              : ColorManager.whiteDarkMode,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: Image.asset(ImageAssets.appLogo)),
                        SizedBox(height: context.height * 0.005),
                        Text(
                          S.of(context).welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: context.width * 0.08,
                                  color: AppPreferences.isDarkMode()
                                      ? ColorManager.primaryDarkLight
                                      : ColorManager.grayLight),
                        ),
                        SizedBox(height: context.height * 0.005),
                        Padding(
                          padding: const EdgeInsets.all(AppSize.s16),
                          child: Column(
                            children: [
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: S.of(context).signIn,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              fontSize: context.width * 0.07,
                                              color: AppPreferences.isDarkMode()
                                                  ? ColorManager
                                                      .primaryDarkLight
                                                  : ColorManager.grayLight),
                                    ),
                                    SizedBox(height: context.height * 0.01),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: S.of(context).email,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontSize: context.width * 0.05,
                                              color: AppPreferences.isDarkMode()
                                                  ? ColorManager
                                                      .primaryDarkLight
                                                  : ColorManager.whiteLight),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    CustomTextFormField(
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
                                        if (!RegExp(
                                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                            .hasMatch(value)) {
                                          return 'Enter a valid email (e.g., user@example.com)';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height * 0.025,
                                    ),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: S.of(context).password,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontSize: context.width * 0.05,
                                              color: AppPreferences.isDarkMode()
                                                  ? ColorManager
                                                      .primaryDarkLight
                                                  : ColorManager.whiteLight),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    CustomTextFormField(
                                      hintText: S.of(context).enterYourPassword,
                                      labelText: S.of(context).password,
                                      isPassword: true,
                                      onChanged: (data) {
                                        password = data;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password is required';
                                        }
                                        if (value.length < 6) {
                                          return 'Password must be at least 6 characters';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ForgetPasswordButton(onPressed: () {
                          Get.toNamed(Routes.forgetPasswordRoute);
                        }),
                        SizedBox(height: context.height * 0.0005),
                        CustomElevatedButton(
                          isLoading: context.read<LoginCubit>().isLoading,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<LoginCubit>().login(
                                  context: context,
                                  email: email!,
                                  password: password!);
                            }
                          },
                          name: S.of(context).signIn,
                          width: context.width * 0.9,
                          fontSize: context.width * 0.045,
                          buttonColor: AppPreferences.isDarkMode()
                              ? ColorManager.primaryLight
                              : ColorManager.primaryDarkMode,
                        ),
                        SizedBox(height: context.height * 0.025),
                        const OrDivider(),
                        SizedBox(height: context.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedIconButton(
                              width: context.width,
                              name: S.of(context).google,
                              onPressed: () {
                                FirebaseServices().signInWithGoogle(context);
                              },
                              imageName: ImageAssets.googleIcon,
                            ),
                            CustomElevatedIconButton(
                              width: context.width,
                              name: S.of(context).facebook,
                              onPressed: () {
                                FirebaseServices().signInWithFacebook(context);
                              },
                              imageName: ImageAssets.facebookIcon,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FooterForLoginAndSignUp(
                  onTap: () {
                    Get.offNamed(Routes.signupRoute);
                  },
                  actionText: S.of(context).signUp,
                  questionText: S.of(context).dontHaveAnAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
