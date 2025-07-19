import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../domain/models.dart';
import '../../../generated/l10n.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/values_manager.dart';
import '../viewmodel/onboarding_viewmodel.dart';

class OnboardingView1 extends StatefulWidget {
  const OnboardingView1({super.key});

  @override
  State<OnboardingView1> createState() => _OnboardingView1State();
}

class _OnboardingView1State extends State<OnboardingView1> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) => _getContentWidget(snapshot.data),
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: AppPreferences.isDarkMode()
            ? ColorManager.whiteLight
            : ColorManager.whiteDarkMode,
        appBar: AppBar(
          backgroundColor: AppPreferences.isDarkMode()
              ? ColorManager.whiteLight
              : ColorManager.whiteDarkMode,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppPreferences.isDarkMode()
                  ? ColorManager.whiteLight
                  : ColorManager.whiteDarkMode,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    S.of(context).skip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primaryLight,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //left Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                //go to previous slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.easeInCirc);
              },
            ),
          ),

          //circles indicator

          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                ),
            ],
          ),

          //right Arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                //go to previous slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.easeInCirc);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
  const OnBoardingPage(this._sliderObject, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        Image.asset(_sliderObject.image),
      ],
    );
  }
}
