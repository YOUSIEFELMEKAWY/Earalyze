import 'package:earalyze/presentation/onBoarding/widgets/app_logo.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:earalyze/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:earalyze/presentation/onBoarding/widgets/onboarding_items.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:lottie/lottie.dart';
import '../../data/data_source/local/app_preferences.dart';
import '../resources/constants_manager.dart';
import 'cubits/onboarding_cubit.dart';
import 'cubits/onboarding_states.dart';
import 'widgets/onboarding_footer.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingItems();
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => OnboardingCubit(controller.items.length),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final onboardingCubit = context.read<OnboardingCubit>();
          final isLastPage = state is OnboardingPageUpdated &&
              state.currentPageIndex == controller.items.length - 1;

          return Scaffold(
            backgroundColor: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            body: PageView.builder(
              onPageChanged: (index) => onboardingCubit.updatePageIndex(index),
              itemCount: controller.items.length,
              controller: onboardingCubit.pageController,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return Column(
                  children: [
                    SizedBox(height: context.height * 0.075),
                    AppLogo(width: width),
                    // Onboarding image
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Lottie.asset(item.image,
                          width: context.width * 0.9,
                          height: context.height * 0.41),
                    ),
                    const Spacer(),
                    OnboardingFooter(
                      pageController: onboardingCubit.pageController,
                      totalPages: controller.items.length,
                      isLastPage: isLastPage,
                      onSkip: () =>
                          onboardingCubit.pageController.animateToPage(
                        controller.items.length - 1,
                        duration: const Duration(
                            milliseconds:
                                AppConstants.animateToFinalPageDuration),
                        curve: Curves.easeInOut,
                      ),
                      onNext: () {
                        if (isLastPage) {
                          Navigator.pushReplacementNamed(
                              context, Routes.loginRoute);
                          onboardingCubit.completeOnboarding();
                        } else {
                          onboardingCubit.pageController.nextPage(
                            duration: const Duration(
                                milliseconds:
                                    AppConstants.animateToNextPageDuration),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      title: item.title,
                      description: item.description,
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
