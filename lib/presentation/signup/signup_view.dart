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
import '../../data/services/firebase_services.dart';
import '../common_widgets/custom_snack_bar.dart';
import '../common_widgets/custom_text_widget.dart';
import '../resources/routes_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(height: context.height * 0.02),
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
                                height: context.height * 0.005,
                              ),
                              CustomTextWidget(
                                mainAxisAlignment: MainAxisAlignment.start,
                                name: AppStrings.email,
                                textStyle: Theme.of(context).textTheme.labelMedium,
                              ),
                              SizedBox(
                                height: context.height * 0.005,
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
                                        height: context.height * 0.01,
                                      ),
                                      CustomTextWidget(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        name: AppStrings.password,
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      SizedBox(
                                        height: context.height * 0.005,
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
                                        height: context.height * 0.005,
                                      ),
                                      CustomTextWidget(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        name: AppStrings.confirmPassword,
                                        textStyle: Theme.of(context).textTheme.labelMedium,
                                      ),
                                      SizedBox(
                                        height: context.height * 0.005,
                                      ),
                                      CustomTextFormField(
                                          hintText: AppStrings.confirmPassword,
                                          labelText: AppStrings.password,
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
                        SizedBox(height: context.height * 0.01),
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
