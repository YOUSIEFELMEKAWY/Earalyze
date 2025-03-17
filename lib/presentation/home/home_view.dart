import 'package:cnav/cnav.dart';
import 'package:earalyze/data/services/firebase_services.dart';
import 'package:earalyze/presentation/home/cubits/home/home_cubit.dart';
import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final userCredential = Get.arguments as User;
    return BlocProvider(
      create: (context) => HomeCubit(user: userCredential),
      child: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            backgroundColor: ColorManager.white,
            appBar: AppBar(
              title: Image.asset(
                ImageAssets.appLogo,
                height: 75,
              ),
              backgroundColor: ColorManager.white,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseServices().logOut(context);
                  },
                  icon: const Icon(IconsManager.logOut),
                ),
              ],
            ),
            body: cubit.widgets[cubit.currentIndex], // Display the current widget
            bottomNavigationBar: CNav(
              currentIndex: cubit.currentIndex,
              backgroundColor: Colors.white,
              elevation: 6,
              bubbleCurve: Curves.linearToEaseOut,
              strokeColor: Colors.transparent,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                // Home Item
                CNavItem(
                  icon: Icon(
                    IconsManager.home,
                    color: cubit.currentIndex == 0
                        ? ColorManager.primaryDark
                        : ColorManager.lightGray,
                  ),
                  title: Text(
                    cubit.titles[0],
                    style: TextStyle(
                      color: cubit.currentIndex == 0
                          ? ColorManager.primaryDark
                          : ColorManager.lightGray,
                    ),
                  ),
                ),
                // Scan Item
                CNavItem(
                  icon: Icon(
                    IconsManager.scan,
                    color: cubit.currentIndex == 1
                        ? ColorManager.primaryDark
                        : ColorManager.lightGray,
                  ),
                  title: Text(
                    cubit.titles[1],
                    style: TextStyle(
                      color: cubit.currentIndex == 1
                          ? ColorManager.primaryDark
                          : ColorManager.lightGray,
                    ),
                  ),
                ),
                // AI Chat Item
                CNavItem(
                  icon: Icon(
                    IconsManager.aiChat,
                    color: cubit.currentIndex == 2
                        ? ColorManager.primaryDark
                        : ColorManager.lightGray,
                  ),
                  title: Text(
                    cubit.titles[2],
                    style: TextStyle(
                      color: cubit.currentIndex == 2
                          ? ColorManager.primaryDark
                          : ColorManager.lightGray,
                    ),
                  ),
                ),
                // Result Item
                CNavItem(
                  icon: Icon(
                    IconsManager.result,
                    color: cubit.currentIndex == 3
                        ? ColorManager.primaryDark
                        : ColorManager.lightGray,
                  ),
                  title: Text(
                    cubit.titles[3],
                    style: TextStyle(
                      color: cubit.currentIndex == 3
                          ? ColorManager.primaryDark
                          : ColorManager.lightGray,
                    ),
                  ),
                ),
                // Profile Item
                CNavItem(
                  icon: Icon(
                    IconsManager.profile,
                    color: cubit.currentIndex == 4
                        ? ColorManager.primaryDark
                        : ColorManager.lightGray,
                  ),
                  title: Text(
                    cubit.titles[4],
                    style: TextStyle(
                      color: cubit.currentIndex == 4
                          ? ColorManager.primaryDark
                          : ColorManager.lightGray,
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