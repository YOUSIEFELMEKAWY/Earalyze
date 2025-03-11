import 'package:earalyze/presentation/common_widgets/custom_elevated_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_elevated_icon_button.dart';
import 'package:earalyze/presentation/common_widgets/custom_text_field.dart';
import 'package:earalyze/presentation/common_widgets/footer_for_login_and_sign_up.dart';
import 'package:earalyze/presentation/login/widgets/forget_password_button.dart';
import 'package:earalyze/presentation/common_widgets/or_divider.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/routes_manager.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                    SizedBox(height: width * 0.04),
                    Text(
                      AppStrings.welcome,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    SizedBox(height: width * 0.04),
                    Padding(
                      padding: const EdgeInsets.all(AppSize.s16),
                      child: Column(
                        children: [
                          const CustomTextField(
                            hintText: AppStrings.enterYourEmail,
                            labelText: AppStrings.email,
                          ),
                          SizedBox(
                            height: width * 0.05,
                          ),
                          const CustomTextField(
                            hintText: AppStrings.enterYourPassword,
                            labelText: AppStrings.password,
                          ),
                        ],
                      ),
                    ),
                    ForgetPasswordButton(onPressed: () {}),
                    SizedBox(height: width * 0.06),
                    CustomElevatedButton(
                      onPressed: () {},
                      name: AppStrings.signUp,
                      width: width,
                    ),
                    SizedBox(height: width * 0.08),
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
    );

  }
}
