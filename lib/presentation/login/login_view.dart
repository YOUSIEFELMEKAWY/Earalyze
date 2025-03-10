import 'package:earalyze/presentation/login/widgets/custom_text_field.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
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
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.forgetPassword,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(height: width * 0.06),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.primary, // Customize your color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(
                    vertical: AppSize.s16,
                    horizontal:
                        width * 0.39), // Adjust padding for height and width
              ),
              child: Text(
                AppStrings.signIn,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(height: width * 0.08),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: AppSize.s3, // Line thickness
                    color: ColorManager.primary, // Line color
                    endIndent: AppSize.s20, // Space between line and text
                  ),
                ),
                Text(
                  AppStrings.or, // Replace with your desired text
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Expanded(
                  child: Divider(
                    thickness: AppSize.s3, // Line thickness
                    color: ColorManager.primary, // Line color
                    indent: AppSize.s20, // Space between line and text
                  ),
                ),
              ],
            ),
            SizedBox(height: width * 0.07),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Space between buttons
              children: [
                // Google Button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.googleIcon, // Your Google icon path
                    width: width * 0.12,
                    height: 24.0,
                  ),
                  label: Text(AppStrings.google,
                      style: Theme.of(context).textTheme.displayMedium),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.s30), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSize.s10,
                        horizontal: AppSize.s16), // Button padding
                  ),
                ),

                // Facebook Button
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    ImageAssets.facebookIcon, // Your Facebook icon path
                    width: width * 0.12,
                    height: 24.0,
                  ),
                  label: Text(AppStrings.facebook,
                      style: Theme.of(context).textTheme.displayMedium),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.primary, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(AppSize.s30), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSize.s10,
                        horizontal: AppSize.s14), // Button padding
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: width * 0.15,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              decoration: BoxDecoration(
                color: ColorManager
                    .primaryDark, // Background color similar to the image
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppSize.s30),
                  topRight: Radius.circular(AppSize.s30),
                ),
              ),
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: AppStrings.dontHaveAnAccount,
                  style: Theme.of(context).textTheme.displaySmall,
                  children: [
                    TextSpan(
                      text: AppStrings.signUp,
                      style: Theme.of(context).textTheme.displayMedium,
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ), // Removed the extra parenthesis here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
