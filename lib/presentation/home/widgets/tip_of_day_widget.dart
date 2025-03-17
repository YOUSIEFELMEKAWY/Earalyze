import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:earalyze/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class TipOfDayWidget extends StatelessWidget {
  const TipOfDayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFF537380), width: 1),
      ),
      elevation: 0,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: context.width * 0.15,
              width: context.width * 0.15,
              child: Image.asset(
                ImageAssets.tipImage,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: context.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.tipOfTheDay,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: context.width * 0.038),
                  ),
                  SizedBox(height: context.height * 0.004),
                  Text(
                    'Regularly consult with your doctor for better health monitoring.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: context.width * 0.03),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
