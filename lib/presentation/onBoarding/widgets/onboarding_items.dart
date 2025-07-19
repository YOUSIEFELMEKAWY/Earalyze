import 'package:earalyze/presentation/resources/assets_manager.dart';
import '../../../generated/l10n.dart';

class OnBoardingInfo {
  final String title;
  final String description;
  final String image;

  OnBoardingInfo(
      {required this.title, required this.description, required this.image});
}

class OnBoardingItems {
  List<OnBoardingInfo> get items => [
        OnBoardingInfo(
            title: S.current.onboardingTitle1,
            description: S.current.onboardingSubTitle1,
            image: ImageAssets.onboardingAni1),
        OnBoardingInfo(
            title: S.current.onboardingTitle2,
            description: S.current.onboardingSubTitle2,
            image: ImageAssets.onboardingAni2),
        OnBoardingInfo(
            title: S.current.onboardingTitle3,
            description: S.current.onboardingSubTitle3,
            image: ImageAssets.onboardingAni3),
      ];
}
