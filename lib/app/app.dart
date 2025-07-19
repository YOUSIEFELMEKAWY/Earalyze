import 'package:earalyze/data/data_source/local/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import '../generated/l10n.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  //const MyApp({super.key}); //default constructor
  // named constructor
  const MyApp._internal();

  static MyApp? _instance;

  // Factory constructor to return the singleton instance
  factory MyApp() {
    _instance ??= const MyApp._internal(); // Only initialize once
    return _instance!;
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale(AppPreferences.getLanguageCode()),
      fallbackLocale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      getPages: RouteGenerator.getPages,
      initialRoute: Routes.splashRoute,
      theme: getAppTheme(context),
    );
  }
}
