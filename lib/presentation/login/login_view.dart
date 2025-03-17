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
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/services/firebase_services.dart';
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
          backgroundColor: ColorManager.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: context.height * 0.02),
                        Center(child: Image.asset(ImageAssets.appLogo)),
                        SizedBox(height: context.height * 0.005),
                        Text(
                          AppStrings.welcome,
                          style: Theme.of(context).textTheme.displayLarge,
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
                                      name: AppStrings.signIn,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                    ),
                                    SizedBox(height: context.height * 0.01),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: AppStrings.email,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    CustomTextFormField(
                                        hintText: AppStrings.enterYourEmail,
                                        labelText: AppStrings.email,
                                        isPassword: false,
                                        onChanged: (data) {
                                          email = data;
                                        }),
                                    SizedBox(
                                      height: context.height * 0.025,
                                    ),
                                    CustomTextWidget(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      name: AppStrings.password,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    CustomTextFormField(
                                        hintText: AppStrings.enterYourPassword,
                                        labelText: AppStrings.password,
                                        isPassword: true,
                                        onChanged: (data) {
                                          password = data;
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        ForgetPasswordButton(onPressed: () {}),
                        SizedBox(height: context.height * 0.0005),
                        CustomElevatedButton(
                          isLoading: context
                              .read<LoginCubit>().isLoading,
                          onPressed: () {
                            if(formKey.currentState!.validate())
                            {
                              context
                                  .read<LoginCubit>()
                                  .login(context: context,email: email!, password: password!);
                            }
                            },
                          name: AppStrings.signIn,
                          width: context.width,
                        ),
                        SizedBox(height: context.height * 0.025),
                        const OrDivider(),
                        SizedBox(height: context.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedIconButton(
                              width: context.width,
                              name: AppStrings.google,
                              onPressed: ()
                              {
                                FirebaseServices().signInWithGoogle(context);
                              },
                              imageName: ImageAssets.googleIcon,
                            ),
                            CustomElevatedIconButton(
                              width: context.width,
                              name: AppStrings.facebook,
                              onPressed: ()
                              {
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
                  actionText: AppStrings.signUp,
                  questionText: AppStrings.dontHaveAnAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
