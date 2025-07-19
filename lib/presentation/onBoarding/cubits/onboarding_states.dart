abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingPageUpdated extends OnboardingState {
  final int currentPageIndex;

  OnboardingPageUpdated(this.currentPageIndex);
}

class OnboardingCompleted extends OnboardingState {}
