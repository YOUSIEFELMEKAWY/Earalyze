import 'package:earalyze/presentation/onBoarding/widgets/onboarding_items.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/constants_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../resources/routes_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = OnBoardingItems();
  final pageController = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: PageView.builder(
        onPageChanged: (index) => setState(() {
          isLastPage = controller.items.length -1 == index;
        }),
        itemCount: controller.items.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: AppSize.s60,
              ),
              SizedBox(
                width: width * 0.48,
                child: Image.asset(
                  ImageAssets.splashLogo,
                ),
              ),
              Image.asset(
                controller.items[index].image,
              ),
              const Spacer(),
              Container(
                height: width * 0.6,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppSize.s40),
                    topLeft: Radius.circular(AppSize.s40),
                  ),
                  border: Border.all(
                    color: ColorManager.grey1, // Outline color
                    width: 1, // Outline thickness
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: controller.items.length,
                      effect: WormEffect(
                          activeDotColor: ColorManager.primary,
                          dotWidth: AppSize.s12,
                          dotHeight: AppSize.s12),
                    ),
                    SizedBox(
                      width: width * 0.56,
                      child: Text(
                        controller.items[index].title,
                        style: Theme.of(context).textTheme.headlineLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.9,
                      child: Text(
                        controller.items[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () => pageController.animateToPage(
                            controller.items.length - 1,
                            duration: const Duration(
                                milliseconds: AppConstants
                                    .animateToFinalPageDuration), // Adjust the speed
                            curve: Curves.easeInOut,
                          ),
                          child: Text(
                            AppStrings.skip,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(
                          width: width * 0.3,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager
                                .primary, // Background color of the button
                            foregroundColor: ColorManager.white,
                          ),
                          onPressed: () => pageController.nextPage(
                              duration: const Duration(
                                  milliseconds:
                                      AppConstants.animateToNextPageDuration),
                              curve: Curves.easeIn),
                          child: Row(
                            children: [
                              isLastPage? getStarted() : Text(
                                AppStrings.next,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const Icon(Icons.arrow_forward)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  Widget getStarted()
  {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager
            .primary,
        foregroundColor: ColorManager.white,
      ),
      onPressed: ()
      {
        completeOnboarding();
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      },
      child: Text(
        AppStrings.getStarted,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true); // Save the flag
  }
}
