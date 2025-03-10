import 'package:earalyze/presentation/onBoarding/widgets/app_logo.dart';
import 'package:earalyze/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:earalyze/presentation/onBoarding/widgets/onboarding_items.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
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
            backgroundColor: ColorManager.white,
            body: PageView.builder(
              onPageChanged: (index) => onboardingCubit.updatePageIndex(index),
              itemCount: controller.items.length,
              controller: onboardingCubit.pageController,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: AppSize.s60),
                    AppLogo(width: width),
                    //onBoarding image
                    Image.asset(controller.items[index].image),
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
                      title: controller.items[index].title,
                      description: controller.items[index].description,
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
