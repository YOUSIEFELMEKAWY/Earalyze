import 'package:cnav/cnav.dart';
import 'package:earalyze/data/services/firebase_services.dart';
import 'package:earalyze/presentation/home/cubits/home/home_cubit.dart';
import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/home/cubits/result/result_cubit.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../data/data_source/local/app_preferences.dart';
import 'cubits/chat_ai/chat_ai_cubit.dart';
import 'cubits/profile/profile_cubit.dart';
import 'cubits/scan/scan_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCredential = Get.arguments as User;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit(user: userCredential)),
        BlocProvider(create: (context) => ScanCubit()),
        BlocProvider(create: (context) => ChatAiCubit(user: userCredential)),
        BlocProvider(create: (context) => ResultCubit()),
        BlocProvider(create: (context) => ProfileCubit()),

      ],
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            backgroundColor: AppPreferences.isDarkMode()
                ? ColorManager.whiteLight
                : ColorManager.whiteDarkMode,
            appBar: AppBar(
              title: Image.asset(
                ImageAssets.appLogo,
                height: 75,
              ),
              backgroundColor: AppPreferences.isDarkMode()
                  ? ColorManager.whiteLight
                  : ColorManager.whiteDarkMode,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseServices().logOut(context);
                  },
                  icon: Icon(IconsManager.logOut,
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.primaryLight
                          : ColorManager.whiteLight),
                ),
              ],
            ),
            body: TweenAnimationBuilder<double>(
                key: ValueKey<int>(cubit.currentIndex),
                tween:
                    Tween(begin: 0.0, end: 1.0), // Required: defines start/end

                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                builder: (context, opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: cubit.widgets[cubit.currentIndex],
                  );
                }),
            bottomNavigationBar: CNav(
              currentIndex: cubit.currentIndex,
              backgroundColor: AppPreferences.isDarkMode()
                  ? ColorManager.whiteLight
                  : ColorManager.whiteDarkMode,
              elevation: 6,
              bubbleCurve: Curves.linearToEaseOut,
              strokeColor: Colors.transparent,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                CNavItem(
                  icon: Icon(
                    IconsManager.home,
                    color: cubit.currentIndex == 0
                        ? AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight
                        : AppPreferences.isDarkMode()
                            ? ColorManager.lightGrayLight
                            : ColorManager.lightGrayDarkMode,
                  ),
                  title: Text(
                    cubit.titles[0],
                    style: TextStyle(
                      color: cubit.currentIndex == 0
                          ? AppPreferences.isDarkMode()
                              ? ColorManager.primaryDarkLight
                              : ColorManager.whiteLight
                          : AppPreferences.isDarkMode()
                              ? ColorManager.lightGrayLight
                              : ColorManager.lightGrayDarkMode,
                    ),
                  ),
                ),
                CNavItem(
                  icon: Icon(
                    IconsManager.scan,
                    color: cubit.currentIndex == 1
                        ? AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight
                        : AppPreferences.isDarkMode()
                            ? ColorManager.lightGrayLight
                            : ColorManager.lightGrayDarkMode,
                  ),
                  title: Text(
                    cubit.titles[1],
                    style: TextStyle(
                      color: cubit.currentIndex == 1
                          ? AppPreferences.isDarkMode()
                              ? ColorManager.primaryDarkLight
                              : ColorManager.whiteLight
                          : AppPreferences.isDarkMode()
                              ? ColorManager.lightGrayLight
                              : ColorManager.lightGrayDarkMode,
                    ),
                  ),
                ),
                CNavItem(
                  icon: Icon(
                    IconsManager.aiChat,
                    color: cubit.currentIndex == 2
                        ? AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight
                        : AppPreferences.isDarkMode()
                            ? ColorManager.lightGrayLight
                            : ColorManager.lightGrayDarkMode,
                  ),
                  title: Text(
                    cubit.titles[2],
                    style: TextStyle(
                      color: cubit.currentIndex == 2
                          ? AppPreferences.isDarkMode()
                              ? ColorManager.primaryDarkLight
                              : ColorManager.whiteLight
                          : AppPreferences.isDarkMode()
                              ? ColorManager.lightGrayLight
                              : ColorManager.lightGrayDarkMode,
                    ),
                  ),
                ),
                CNavItem(
                  icon: Icon(
                    IconsManager.result,
                    color: cubit.currentIndex == 3
                        ? AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight
                        : AppPreferences.isDarkMode()
                            ? ColorManager.lightGrayLight
                            : ColorManager.lightGrayDarkMode,
                  ),
                  title: Text(
                    cubit.titles[3],
                    style: TextStyle(
                      color: cubit.currentIndex == 3
                          ? AppPreferences.isDarkMode()
                              ? ColorManager.primaryDarkLight
                              : ColorManager.whiteLight
                          : AppPreferences.isDarkMode()
                              ? ColorManager.lightGrayLight
                              : ColorManager.lightGrayDarkMode,
                    ),
                  ),
                ),
                CNavItem(
                  icon: Icon(
                    IconsManager.profile,
                    color: cubit.currentIndex == 4
                        ? AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight
                        : AppPreferences.isDarkMode()
                            ? ColorManager.lightGrayLight
                            : ColorManager.lightGrayDarkMode,
                  ),
                  title: Text(
                    cubit.titles[4],
                    style: TextStyle(
                      color: cubit.currentIndex == 4
                          ? AppPreferences.isDarkMode()
                              ? ColorManager.primaryDarkLight
                              : ColorManager.whiteLight
                          : AppPreferences.isDarkMode()
                              ? ColorManager.lightGrayLight
                              : ColorManager.lightGrayDarkMode,
                    ),
                  ),
                ),
              ],
              margin: const EdgeInsets.all(15),
              borderRadius: const Radius.circular(25),
            ),
          );
        },
      ),
    );
  }
}
