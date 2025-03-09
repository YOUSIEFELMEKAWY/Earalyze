import 'dart:async';
import '../../../domain/models.dart';
import '../../base/base_view_model.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller output
  //onboarding viewmodel inputs

  final StreamController _streamController = StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;


  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();

  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map(
        (sliderViewObject) => sliderViewObject,
      );

  void _postDataToView()
  {
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

  //onBoarding private functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onboardingTitle1,
            AppStrings.onboardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onboardingTitle2,
            AppStrings.onboardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onboardingTitle3,
            AppStrings.onboardingSubTitle3, ImageAssets.onboardingLogo3),
      ];
}

//inputs mean that "orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  void goNext(); //when user clicks on right arrow or swipe left
  void goPrevious(); //when user clicks on left arrow or swipe right
  void onPageChanged(int index);
  //stream controller input
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
