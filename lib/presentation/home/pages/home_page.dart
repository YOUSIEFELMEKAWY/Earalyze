import 'package:earalyze/presentation/home/cubits/home/home_cubit.dart';
import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/home/widgets/tip_of_day_widget.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';
import '../widgets/aim_of_app_widget.dart';
import '../widgets/analysis_state_widget.dart';
import '../widgets/custom_nav_button.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      final cubit = context.read<HomeCubit>();
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: context.height * 0.004,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                '${context.read<HomeCubit>().getTimeBasedGreeting(context)} , ${user.displayName}',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: context.width * 0.05,
                    color: AppPreferences.isDarkMode()
                        ? ColorManager.primaryDarkLight
                        : ColorManager.whiteLight),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(28.0),
              child: AimOfAppWidget(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomNavButton(
                  onPressed: () {
                    context.read<HomeCubit>().changeIndex(1);
                  },
                  label: cubit.titles[1],
                  icon: IconsManager.scan,
                ),
                CustomNavButton(
                  onPressed: () {
                    context.read<HomeCubit>().changeIndex(3);
                  },
                  label: cubit.titles[3],
                  icon: IconsManager.result,
                ),
                CustomNavButton(
                  onPressed: () {
                    context.read<HomeCubit>().changeIndex(4);
                  },
                  label: cubit.titles[4],
                  icon: IconsManager.profile,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnalysisStateWidget(
                  label: S.of(context).totalAnalysis,
                  number: 0,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnalysisStateWidget(
                  label: S.of(context).healthyCases,
                  number: 0,
                ),
                AnalysisStateWidget(
                  label: S.of(context).criticalCases,
                  number: 0,
                ),
              ],
            ),
            const TipOfDayWidget(),
          ],
        ),
      );
    });
  }
}
