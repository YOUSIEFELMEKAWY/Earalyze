import 'package:earalyze/presentation/home/cubits/result/result_cubit.dart';
import 'package:earalyze/presentation/home/cubits/result/result_states.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../cubits/scan/scan_cubit.dart';
import '../widgets/custom_result_card.dart';

class ResultPage extends StatelessWidget {
  final User user;
  const ResultPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultCubit, ResultStates>(
      builder: (context, state) {
        final result = context.read<ScanCubit>().predictionResult;
        return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.004,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).result,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: context.width * 0.08,
                        color: AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomResultCard(
                    title: S.of(context).angleType,
                    message: result == null ? 'No Data' : result.predictedClass,
                    width: context.width * 0.45,
                    fontSize1: context.width * 0.04,
                    fontSize2: context.width * 0.05,
                  ),
                  CustomResultCard(
                    title: S.of(context).stapesLenth,
                    message: result == null ? 'No Data' : "${result.estimatedLengthMm.toStringAsFixed(2)} mm",
                    width: context.width * 0.45,
                    fontSize1: context.width * 0.036,
                    fontSize2: context.width * 0.05,
                  ),
                ],
              ),
              CustomResultCard(
                title: "Interpretation Box",
                message: result == null ? 'No Data' : result.interpretation,
                width: context.width * 0.8,
                fontSize1: context.width * 0.06,
                fontSize2: context.width * 0.03,
              ),
              CustomResultCard(
                title: "Recommendation Card",
                message: result == null ? 'No Data' : result.recommendation,
                width: context.width,
                fontSize1: context.width * 0.06,
                fontSize2: context.width * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomElevatedButton(
                    width: context.width * 0.2,
                    onPressed: () {
                      context.read<ResultCubit>().savePrintedPdf(user);
                    },
                    name: S.of(context).pdf,
                    isLoading: false,
                    fontSize: context.width * 0.04,
                    buttonColor: AppPreferences.isDarkMode()
                        ? ColorManager.errorLight
                        : ColorManager.errorDarkMode,
                  ),
                  CustomElevatedButton(
                    width: context.width * 0.2,
                    onPressed: () {
                      context.read<ResultCubit>().sharePdf(user);
                    },
                    name: S.of(context).shareResult,
                    isLoading: false,
                    fontSize: context.width * 0.04,
                    buttonColor: AppPreferences.isDarkMode()
                        ? ColorManager.greenLight
                        : ColorManager.greenDarkMode,
                  ),
                ],
              ),
            ],
          ),
        ),
      );}
    );
  }
}
