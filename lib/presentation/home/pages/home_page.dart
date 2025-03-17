import 'package:earalyze/presentation/home/cubits/home/home_cubit.dart';
import 'package:earalyze/presentation/home/cubits/home/home_states.dart';
import 'package:earalyze/presentation/home/widgets/tip_of_day_widget.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/aim_of_app_widget.dart';
import '../widgets/analysis_state_widget.dart';
import '../widgets/custom_nav_button.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder:(context, state) =>  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height * 0.004,),
          Text(
            '  Good Morning , ${user.displayName}',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: context.width * 0.05),
          ),
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: AimOfAppWidget(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomNavButton(
                onPressed: ()
                {
                  context.read<HomeCubit>().changeIndex(1);
                },
                label: "Scan",
                icon: IconsManager.scan,
              ),
              CustomNavButton(
                onPressed: ()
                {
                  context.read<HomeCubit>().changeIndex(3);
                },
                label: "Result",
                icon: IconsManager.result,
              ),
              CustomNavButton(
                onPressed: ()
                {
                  context.read<HomeCubit>().changeIndex(4);
                },
                label: "Profile",
                icon: IconsManager.profile,
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnalysisStateWidget(
                label: AppStrings.totalAnalysis,
                number: 0,
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnalysisStateWidget(
                label: AppStrings.healthyCases,
                number: 0,
              ),
              AnalysisStateWidget(
                label: AppStrings.criticalCases,
                number: 0,
              ),
            ],
          ),
          const TipOfDayWidget(),
        ],
      ),
    );
  }
}
