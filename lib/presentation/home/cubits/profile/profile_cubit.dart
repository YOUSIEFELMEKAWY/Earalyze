import 'dart:ui';
import 'package:earalyze/presentation/home/cubits/profile/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  Future<void> changeLanguage() async {
    var currentLocale = Get.locale?.languageCode;
    final prefs = await SharedPreferences.getInstance();
    if (currentLocale == 'en') {
      Get.updateLocale(const Locale('ar'));
      await prefs.setString('language', 'ar');
    } else {
      Get.updateLocale(const Locale('en'));
      await prefs.setString('language', 'en');
    }
    emit(ChangeLanguageState());
  }

  Future<void> changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool currentMode = prefs.getBool('isDarkMode') ?? false;
    bool newMode = !currentMode;

    prefs.setBool('isDarkMode', newMode);
    emit(ChangeThemeState());
  }
}
