import 'package:earalyze/presentation/resources/styles_manager.dart';
import 'package:earalyze/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';


ThemeData getAppTheme() {
  return ThemeData(
    //main color
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,

    //card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.gray,
      elevation: AppSize.s4,
    ),

    //app bar theme

    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle:
            getRegularStyle(fontSize: AppSize.s16, color: ColorManager.white)),

    //button theme

    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary),

    //elevated button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(
        color: ColorManager.white,
        fontSize: AppSize.s17,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    )),

    //text theme

    textTheme: TextTheme(
      headlineLarge:
          getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s22),
      headlineMedium: getBoldStyle(color: ColorManager.primary, fontSize: AppSize.s17),
      displayLarge:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s40),
      titleMedium:
          getMediumStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodyLarge: getLightStyle(color: ColorManager.white),
      bodySmall: getRegularStyle(color: ColorManager.black),
      bodyMedium: getRegularStyle(color: ColorManager.primary),
      displayMedium: getBoldStyle(color: ColorManager.white , fontSize: AppSize.s18),
      displaySmall: getRegularStyle(color: ColorManager.white , fontSize: AppSize.s18),
    ),

    //input decoration theme(text form field)

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.gray, fontSize: AppSize.s14),
      labelStyle:
          getMediumStyle(color: ColorManager.gray, fontSize: AppSize.s14),
      errorStyle: getRegularStyle(color: ColorManager.error),
      //enable border style
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      //focus border style
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.gray, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      //error border style
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}
