import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/home/pages/chat_ai_page.dart';
import 'package:earalyze/presentation/home/pages/home_page.dart';
import 'package:earalyze/presentation/home/pages/profile_page.dart';
import 'package:earalyze/presentation/home/pages/result_page.dart';
import 'package:earalyze/presentation/home/pages/scan_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class HomeCubit extends Cubit<HomeStates> {
  final User user;
  int currentIndex = 0;
  late final List widgets;
  List<String> get titles => [
        S.current.home,
        S.current.scan,
        S.current.aiChat,
        S.current.result,
        S.current.profile
      ];

  HomeCubit({required this.user}) : super(HomeScreenInitialState()) {
    widgets = [
      HomePage(
        user: user,
      ),
      const ScanPage(),
      ChatAiPage(user: user),
      ResultPage(
        user: user,
      ),
      ProfilePage(
        user: user,
      ),
    ];
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  String getTimeBasedGreeting(BuildContext context) {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return S.of(context).goodMorning;
    } else if (hour >= 12 && hour < 17) {
      return S.of(context).goodEvening;
    } else {
      return S.of(context).goodEvening;
    }
  }



}
