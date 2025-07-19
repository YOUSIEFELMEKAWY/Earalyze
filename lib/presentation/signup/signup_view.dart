import 'package:earalyze/generated/l10n.dart';
import 'package:earalyze/presentation/common_widgets/custom_elevated_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_elevated_icon_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_text_form_field.dart';
import 'package:earalyze/presentation/common_widgets/footer_for_login_and_sign_up.dart';
import 'package:earalyze/presentation/common_widgets/or_divider.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:earalyze/presentation/signup/cubits/signup_cubit.dart';
import 'package:earalyze/presentation/signup/cubits/signup_states.dart';
import 'package:earalyze/presentation/signup/widgets/terms_and_conditions_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../../data/services/firebase_services.dart';
import '../common_widgets/custom_snack_bar.dart';
import '../common_widgets/custom_text_widget.dart';
import '../resources/routes_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    String? firstName;
    String? lastName;
    String? email;
    String? password;
    String? confirmPassword;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocBuilder<SignupCubit, SignupStates>(
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
                        Text(
                          S.of(context).welcome,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: context.height * 0.038,
                                  color: AppPreferences.isDarkMode()
                                      ? ColorManager.primaryDarkLight
                                      : ColorManager.grayLight),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSize.s16),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextWidget(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  name: S.of(context).signUp,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: context.height * 0.028,
                                          color: AppPreferences.isDarkMode()
                                              ? ColorManager.primaryDarkLight
                                              : ColorManager.grayLight),
                                ),
                                SizedBox(
                                  height: context.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          name: S.of(context).firstName,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  fontSize: context.height *
                                                      0.022,
                                                  color: AppPreferences
                                                          .isDarkMode()
                                                      ? ColorManager
                                                          .primaryDarkLight
                                                      : ColorManager
                                                          .whiteLight),
                                        ),
                                        SizedBox(
                                          width: context.width * 0.43,
                                          child: CustomTextFormField(
                                            hintText: S.of(context).firstName,
                                            labelText: S.of(context).firstName,
                                            isPassword: false,
                                            onChanged: (data) {
                                              firstName = data;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'enter your first name';
                                              }
                                              if (value.length < 3) {
                                                return '3+ chars required.';
                                              }
                                              return null; // Return null if the input is valid
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          name: S.of(context).lastName,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .labelMedium
                                              ?.copyWith(
                                                  fontSize: context.height *
                                                      0.022,
                                                  color: AppPreferences
                                                          .isDarkMode()
                                                      ? ColorManager
                                                          .primaryDarkLight
                                                      : ColorManager
                                                          .whiteLight),
                                        ),
                                        SizedBox(
                                          width: context.width * 0.43,
                                          child: CustomTextFormField(
                                            hintText: S.of(context).lastName,
                                            labelText: S.of(context).lastName,
                                            isPassword: false,
                                            onChanged: (data) {
                                              lastName = data;
                                            },
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'enter your last name';
                                              }
                                              if (value.length < 3) {
                                                return '3+ chars required';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: context.height * 0.01,
                                ),
                                CustomTextWidget(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  name: S.of(context).email,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          fontSize: context.height * 0.022,
                                          color: AppPreferences.isDarkMode()
                                              ? ColorManager.primaryDarkLight
                                              : ColorManager.whiteLight),
                                ),
                                SizedBox(
                                  height: context.height * 0.005,
                                ),
                                Column(
                                  children: [
                                    CustomTextFormField(
                                      hintText: S.of(context).enterYourEmail,
                                      labelText: S.of(context).email,
                                      isPassword: false,
                                      onChanged: (data) {
                                        email = data;
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        if (value.length < 3) {
                                          return 'Email must be at least 3 characters';
                                        }
                                        if (!context
                                            .read<SignupCubit>()
                                            .isValidEmail(value)) {
                                          return 'Please enter a valid email (e.g., user@example.com)';
                                        }
                                        return null; // No error
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: S.of(context).password,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontSize: context.height * 0.022,
                                              color: AppPreferences.isDarkMode()
                                                  ? ColorManager
                                                      .primaryDarkLight
                                                  : ColorManager.whiteLight),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.005,
                                    ),
                                    CustomTextFormField(
                                        hintText:
                                            S.of(context).enterYourPassword,
                                        labelText: S.of(context).password,
                                        isPassword: true,
                                        onChanged: (data) {
                                          password = data;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value.length < 8) {
                                            return 'Password must be at least 8 characters';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[A-Z]'))) {
                                            return 'Password must contain at least 1 uppercase letter';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[a-z]'))) {
                                            return 'Password must contain at least 1 lowercase letter';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[0-9]'))) {
                                            return 'Password must contain at least 1 number';
                                          }
                                          if (!value.contains(RegExp(
                                              r'[!@#$%^&*(),.?":{}|<>]'))) {
                                            return 'Password must contain at least 1 special character';
                                          }
                                          return null;
                                        }),
                                    SizedBox(
                                      height: context.height * 0.005,
                                    ),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: S.of(context).confirmPassword,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(
                                              fontSize: context.height * 0.022,
                                              color: AppPreferences.isDarkMode()
                                                  ? ColorManager
                                                      .primaryDarkLight
                                                  : ColorManager.whiteLight),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.005,
                                    ),
                                    CustomTextFormField(
                                        hintText: S.of(context).confirmPassword,
                                        labelText:
                                            S.of(context).confirmPassword,
                                        isPassword: true,
                                        onChanged: (data) {
                                          confirmPassword = data;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Password is required';
                                          }
                                          if (value.length < 8) {
                                            return 'Password must be at least 8 characters';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[A-Z]'))) {
                                            return 'Password must contain at least 1 uppercase letter';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[a-z]'))) {
                                            return 'Password must contain at least 1 lowercase letter';
                                          }
                                          if (!value
                                              .contains(RegExp(r'[0-9]'))) {
                                            return 'Password must contain at least 1 number';
                                          }
                                          if (!value.contains(RegExp(
                                              r'[!@#$%^&*(),.?":{}|<>]'))) {
                                            return 'Password must contain at least 1 special character';
                                          }
                                          return null;
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        TermsAndConditionsAgreement(
                          launchPrivacyPolicy: () =>
                              context.read<SignupCubit>().launchPrivacyPolicy(),
                          launchTerms: () =>
                              context.read<SignupCubit>().launchTerms(),
                        ),
                        SizedBox(height: context.height * 0.01),
                        CustomElevatedButton(
                          isLoading: context.read<SignupCubit>().isLoading,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (password != confirmPassword) {
                                customSnackBar(
                                    context, S.of(context).passwordDontMatch);
                              } else {
                                context.read<SignupCubit>().signup(
                                    context: context,
                                    firstName: firstName!,
                                    lastName: lastName!,
                                    email: email!,
                                    password: password!);
                              }
                            }
                          },
                          name: S.of(context).signUp,
                          width: context.width,
                          fontSize: context.height * 0.021,
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
                    Get.offNamed(Routes.loginRoute);
                  },
                  actionText: S.of(context).signIn,
                  questionText: S.of(context).alreadyHaveAnAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
