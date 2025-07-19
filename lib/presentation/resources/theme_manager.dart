import 'package:earalyze/data/data_source/local/app_preferences.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:earalyze/presentation/resources/styles_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

ThemeData getAppTheme(BuildContext context) {
  return ThemeData(
    //main color
    primaryColor: AppPreferences.isDarkMode()
        ? ColorManager.primaryLight
        : ColorManager.primaryDarkMode,
    primaryColorLight: AppPreferences.isDarkMode()
        ? ColorManager.lightPrimaryLight
        : ColorManager.lightPrimaryDarkMode,
    primaryColorDark: AppPreferences.isDarkMode()
        ? ColorManager.darkPrimaryLight
        : ColorManager.darkPrimaryDarkMode,
    disabledColor: AppPreferences.isDarkMode()
        ? ColorManager.grey1Light
        : ColorManager.grey1DarkMode,
    splashColor: AppPreferences.isDarkMode()
        ? ColorManager.lightPrimaryLight
        : ColorManager.lightPrimaryDarkMode,

    //card view theme
    cardTheme: CardTheme(
      color: AppPreferences.isDarkMode()
          ? ColorManager.whiteLight
          : ColorManager.whiteDarkMode,
      shadowColor: AppPreferences.isDarkMode()
          ? ColorManager.grayLight
          : ColorManager.grayDarkMode,
      elevation: AppSize.s4,
    ),

    //app bar theme

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppPreferences.isDarkMode()
            ? ColorManager.primaryLight
            : ColorManager.primaryDarkMode,
        elevation: AppSize.s4,
        shadowColor: AppPreferences.isDarkMode()
            ? ColorManager.lightPrimaryLight
            : ColorManager.lightPrimaryDarkMode,
        titleTextStyle: getRegularStyle(
            fontSize: AppSize.s16,
            color: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode)),

    //button theme

    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppPreferences.isDarkMode()
            ? ColorManager.grey1Light
            : ColorManager.grey1DarkMode,
        buttonColor: AppPreferences.isDarkMode()
            ? ColorManager.primaryLight
            : ColorManager.primaryDarkMode,
        splashColor: AppPreferences.isDarkMode()
            ? ColorManager.lightPrimaryLight
            : ColorManager.lightPrimaryDarkMode),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: AppPreferences.isDarkMode()
            ? ColorManager.whiteLight
            : ColorManager.whiteDarkMode,
        fontSize: AppSize.s17,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    )),

    //text theme

    textTheme: TextTheme(
        headlineLarge: getBoldStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            fontSize: context.width * 0.06),
        headlineMedium: getBoldStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            fontSize: FontSize.s17),
        displayLarge: getRegularStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.primaryDarkDarkMode,
            fontSize: context.width * 0.1),
        titleMedium: getMediumStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            fontSize: context.width * 0.05),
        bodyLarge: getLightStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            fontSize: context.width * 0.05),
        bodySmall: getRegularStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.blackLight
                : ColorManager.blackDarkMode,
            fontSize: context.width * 0.04),
        bodyMedium: getRegularStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            fontSize: context.width * 0.04),
        displayMedium: getBoldStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            fontSize: FontSize.s18),
        displaySmall: getRegularStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            fontSize: FontSize.s18),
        headlineSmall: getBoldStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            fontSize: context.width * 0.052),
        labelMedium: getLightStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.primaryDarkDarkMode,
            fontSize: context.width * 0.06)),

    //input decoration theme(text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularStyle(
          color: AppPreferences.isDarkMode()
              ? ColorManager.grayLight
              : ColorManager.grayDarkMode,
          fontSize: AppSize.s14),
      labelStyle: getMediumStyle(
          color: AppPreferences.isDarkMode()
              ? ColorManager.grayLight
              : ColorManager.grayDarkMode,
          fontSize: AppSize.s14),
      errorStyle: getRegularStyle(
          color: AppPreferences.isDarkMode()
              ? ColorManager.errorLight
              : ColorManager.errorDarkMode,
          fontSize: context.width * 0.2),
      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryLight
                : ColorManager.primaryDarkMode,
            width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focus border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.grayLight
                : ColorManager.grayDarkMode,
            width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.errorLight
                : ColorManager.errorDarkMode,
            width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
