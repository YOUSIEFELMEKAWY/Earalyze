import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';

class OnboardingFooter extends StatelessWidget {
  final PageController pageController;
  final int totalPages;
  final bool isLastPage;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final String title;
  final String description;

  const OnboardingFooter({
    super.key,
    required this.pageController,
    required this.totalPages,
    required this.isLastPage,
    required this.onSkip,
    required this.onNext,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: context.width * 0.6,
      width: context.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(AppSize.s40),
          topLeft: Radius.circular(AppSize.s40),
        ),
        border: Border.all(
          color: ColorManager.grey1,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: totalPages,
            effect: WormEffect(
              activeDotColor: ColorManager.primary,
              dotWidth: context.width *0.03,
              dotHeight: context.width *0.03,
            ),
          ),
          SizedBox(
            width: context.width * 0.56,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: context.width * 0.9,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Skip Button
              TextButton(
                onPressed: onSkip,
                child: Text(
                  AppStrings.skip,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(width: context.width * 0.3),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primary,
                  foregroundColor: ColorManager.white,
                ),
                onPressed: onNext,
                child: Row(
                  children: [
                    Text(
                      isLastPage ? AppStrings.getStarted : AppStrings.next,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
