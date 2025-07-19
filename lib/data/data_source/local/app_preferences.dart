import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String getLanguageCode() {
    return _prefs?.getString('language') ?? 'en';
  }

  static bool isDarkMode() {
    return _prefs?.getBool('isDarkMode') ?? true;
  }
}
