import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/home/pages/chat_ai_page.dart';
import 'package:earalyze/presentation/home/pages/home_page.dart';
import 'package:earalyze/presentation/home/pages/profile_page.dart';
import 'package:earalyze/presentation/home/pages/result_page.dart';
import 'package:earalyze/presentation/home/pages/scan_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  final User user;
  int currentIndex = 0;
  late final List widgets;
  final List<String> titles = ['Home', 'Scan', 'AI Chat', 'Result', 'Profile'];

  HomeCubit({required this.user}) : super(HomeScreenInitialState()) {
    widgets = [
      HomePage(user: user,),
      const ScanPage(),
      ChatAiPage(user: user),
      const ResultPage(),
      const ProfilePage(),
    ];
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }
}
