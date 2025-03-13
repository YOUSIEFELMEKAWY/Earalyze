import 'package:earalyze/presentation/common_widgets/custom_elevated_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_elevated_icon_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_text_form_field.dart';
import 'package:earalyze/presentation/common_widgets/footer_for_login_and_sign_up.dart';
import 'package:earalyze/presentation/common_widgets/or_divider.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:earalyze/presentation/signup/cubits/signup_cubit.dart';
import 'package:earalyze/presentation/signup/cubits/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../common_widgets/custom_snack_bar.dart';
import '../common_widgets/custom_text_widget.dart';
import '../resources/routes_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    String? email;
    String? password;
    String? confirmPassword;
    GlobalKey<FormState> formKey = GlobalKey();
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocBuilder<SignupCubit,SignupStates>(
        builder: (context, state) =>  Scaffold(
          backgroundColor: ColorManager.white,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: width * 0.04),
                        Center(child: Image.asset(ImageAssets.appLogo)),
                        Text(
                          AppStrings.welcome,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppSize.s16),
                          child: Column(
                            children: [
                              CustomTextWidget(
                                mainAxisAlignment: MainAxisAlignment.start,
                                name: AppStrings.signUp,
                                textStyle: Theme.of(context).textTheme.displayLarge,
                              ),
                              SizedBox(
                                height: width * 0.01,
                              ),
                              CustomTextWidget(
                                mainAxisAlignment: MainAxisAlignment.start,
                                name: AppStrings.email,
                                textStyle: Theme.of(context).textTheme.labelMedium,
                              ),
                              SizedBox(
                                height: width * 0.01,
                              ),
                              Form(
                                key: formKey,
                                  child: Column(
                                    children: [
                                      CustomTextFormField(
                                        hintText: AppStrings.enterYourEmail,
                                        labelText: AppStrings.email,
                                        isPassword: false,
                                        onChanged: (data) {
                                          email = data;
                                        },
                                      ),
                                      SizedBox(
                                        height: width * 0.02,
                                      ),
                                      CustomTextWidget(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        name: AppStrings.password,
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      CustomTextFormField(
                                        hintText: AppStrings.enterYourPassword,
                                        labelText: AppStrings.password,
                                        isPassword: true,
                                        onChanged: (data) {
                                          password = data;
                                        },
                                      ),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      CustomTextWidget(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        name: AppStrings.rePassword,
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      SizedBox(
                                        height: width * 0.01,
                                      ),
                                      CustomTextFormField(
                                          hintText: AppStrings.reEnterYourPassword,
                                          labelText: AppStrings.rePassword,
                                          isPassword: true,
                                          onChanged: (data) {
                                            confirmPassword = data;
                                          }),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: width * 0.02),
                        CustomElevatedButton(
                          isLoading: context.read<SignupCubit>().isLoading,
                          onPressed: () async {
                             if(formKey.currentState!.validate())
                             {
                               if(password != confirmPassword)
                               {
                                 customSnackBar(context, "Passwords do not match.");
                               }else
                               {
                                 context
                                     .read<SignupCubit>()
                                     .signup(context: context,email: email!, password: password!);

                               }
                             }
                          },
                          name: AppStrings.signUp,
                          width: width,
                        ),
                        SizedBox(height: width * 0.07),
                        const OrDivider(),
                        SizedBox(height: width * 0.07),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedIconButton(
                              width: width,
                              name: AppStrings.google,
                              onPressed: () {},
                              imageName: ImageAssets.googleIcon,
                            ),
                            CustomElevatedIconButton(
                              width: width,
                              name: AppStrings.facebook,
                              onPressed: () {},
                              imageName: ImageAssets.facebookIcon,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FooterForLoginAndSignUp(
                  width: width,
                  onTap: () {
                    Get.offNamed(Routes.loginRoute);
                  },
                  actionText: AppStrings.signIn,
                  questionText: AppStrings.alreadyHaveAnAccount,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
