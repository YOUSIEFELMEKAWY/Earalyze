import 'dart:io';
import 'package:earalyze/presentation/home/cubits/home/home_cubit.dart';
import 'package:earalyze/presentation/home/cubits/scan/scan_cubit.dart';
import 'package:earalyze/presentation/home/cubits/scan/scan_states.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../widgets/scan_page_button.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScanCubit, ScanStates>(
      listener: (context, state) {
      if (state is ScanSuccess) {
        context.read<HomeCubit>().changeIndex(3);
      }},
      child: BlocBuilder<ScanCubit, ScanStates>(
        builder: (context, state) {
          final isLoading = state is ScanLoading;
          return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.height * 0.004,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16),
                  child: Text(
                    S.of(context).uploadCtScan,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: context.width * 0.08,
                        color: AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ScanPageButton(
                  icon: IconsManager.scan,
                  label: S.of(context).scanYourRay,
                  onPressed: () {
                    context.read<ScanCubit>().pickImageFromCamera();
                  },
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.primaryLight.withOpacity(0.2)
                      : ColorManager.grayLight,
                ),
                ScanPageButton(
                  icon: IconsManager.uploadRay,
                  label: S.of(context).uploadYourRay,
                  onPressed: () {
                    context.read<ScanCubit>().pickImageFromGallery();
                  },
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.primaryLight.withOpacity(0.9)
                      : ColorManager.primaryDarkMode,
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.01,
            ),
            Text(
              S.of(context).supportedFormats,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: context.width * 0.035,
                  color: AppPreferences.isDarkMode()
                      ? ColorManager.primaryDarkLight
                      : ColorManager.whiteLight),
            ),
            SizedBox(
              height: context.height * 0.03,
            ),
            CustomElevatedButton(
              width: context.width * 0.5,
              onPressed: () {
                context.read<ScanCubit>().analyzeImage();
              },
              name: isLoading ? 'Loading' : S.of(context).analyzeImage ,
              isLoading: false,
              fontSize: context.width * 0.055,
              buttonColor: AppPreferences.isDarkMode()
                  ? ColorManager.primaryLight
                  : ColorManager.primaryDarkMode,
            ),
            if (state is ScanSuccess) ...[
              const Text(
                'Success',
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ] else if (state is ScanError) ...[
              Text(
                'Error: ${state.message}',
                style: const TextStyle(color: Colors.red),
              ),
            ]
          ],
        );}
      ),
    );
  }
}
