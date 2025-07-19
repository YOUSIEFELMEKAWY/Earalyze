import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onboarding_states.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();
  final int totalPages;

  OnboardingCubit(this.totalPages) : super(OnboardingInitial());

  void updatePageIndex(int index) {
    emit(OnboardingPageUpdated(index));
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    emit(OnboardingCompleted());
  }
}
