import 'package:earalyze/domain/models.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';

class OnBoardingItems {
  List<OnBoardingInfo> items = [
    OnBoardingInfo(
        title: AppStrings.onboardingTitle1,
        description: AppStrings.onboardingSubTitle1,
        image: ImageAssets.onboardingLogo1),
    OnBoardingInfo(
        title: AppStrings.onboardingTitle2,
        description: AppStrings.onboardingSubTitle2,
        image: ImageAssets.onboardingLogo2),
    OnBoardingInfo(
        title: AppStrings.onboardingTitle3,
        description: AppStrings.onboardingSubTitle3,
        image: ImageAssets.onboardingLogo3),
  ];
}
