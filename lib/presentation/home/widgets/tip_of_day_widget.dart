import 'dart:async';
import 'package:earalyze/presentation/resources/assets_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:flutter/material.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';

class TipOfDayWidget extends StatefulWidget {
  const TipOfDayWidget({super.key});

  @override
  State<TipOfDayWidget> createState() => _TipOfDayWidgetState();
}

class _TipOfDayWidgetState extends State<TipOfDayWidget> {
  final List<String> messagesEn = [
    'Regularly consult with an audiologist or ENT specialist to monitor your ear health and detect potential issues early.',
    'Wear ear protection when exposed to loud environments to prevent hearing damage or loss.',
    'Avoid inserting objects into your ears, and keep them dry to prevent ear infections and buildup of wax.',
    'Use Earalyze to periodically monitor your ear health and detect early signs of ear diseases using AI-powered diagnostics.',
    'Using cotton swabs in your ears can push wax deeper into the ear canal. Let the ear clean itself naturally.',
    'Staying hydrated helps maintain proper fluid balance in your body, which is essential for maintaining ear health.',
    'If you notice any changes in your hearing, such as ringing, muffled sounds, or discomfort, seek advice from a specialist.',
    'A small amount of ear wax is normal, but excessive buildup can lead to discomfort or hearing loss. Use Earalyze to check for abnormalities.',
    'Listening to music or sounds at high volumes through earphones can harm your hearing. Keep the volume at a safe level.',
    'Tinnitus (ringing in the ears) can be a sign of an underlying issue. Use Earalyze to analyze your ear condition and take early action.',
    'Using Earalyze’s AI-powered system can help you accurately diagnose ear diseases and track changes in your ear health over time.',
    'Sudden hearing loss can be a serious condition. If you experience a rapid decline in hearing, consult an expert immediately.',
    'Proper posture can reduce the strain on your neck and head, which can help prevent ear discomfort, especially in long listening sessions.',
    'Bacteria and dirt can build up on earphones. Clean them regularly to prevent infections in your ears.',
    'A balanced diet rich in vitamins, such as Vitamin E and B12, supports nerve health, which is important for hearing.',
  ];
  final List<String> messagesAr = [

      "استشر أخصائي السمع أو طبيب الأذن بانتظام لمراقبة صحة أذنك والكشف عن المشكلات المحتملة مبكرًا.",
      "ارتدِ واقي الأذن عند التعرض للأماكن الصاخبة لحماية سمعك من الضرر أو الفقدان.",
      "تجنب إدخال الأشياء في أذنيك، واحرص على إبقائهما جافتين لتجنب التهابات الأذن وتراكم الشمع.",
      "استخدم Earalyze لمراقبة صحة أذنك بشكل دوري والكشف عن علامات الأمراض الأذنية المبكرة باستخدام التشخيص المدعوم بالذكاء الاصطناعي.",
      "استخدام أعواد القطن في أذنيك يمكن أن يدفع الشمع إلى عمق القناة السمعية. دع الأذن تنظف نفسها بشكل طبيعي.",
      "احرص على شرب الماء بانتظام للحفاظ على التوازن السائل في جسمك، وهو أمر مهم لصحة الأذن.",
      "إذا لاحظت أي تغييرات في سمعك، مثل الطنين أو الأصوات المكتومة أو الانزعاج، استشر مختصًا.",
      "كمية صغيرة من الشمع في الأذن أمر طبيعي، ولكن تراكمه المفرط قد يؤدي إلى الانزعاج أو فقدان السمع. استخدم Earalyze للتحقق من الشذوذ.",
      "الاستماع للموسيقى أو الأصوات بصوت عالٍ عبر السماعات يمكن أن يؤذي سمعك. حافظ على مستوى الصوت في حد آمن.",
      "الطنين (الرنين في الأذن) يمكن أن يكون علامة على مشكلة أساسية. استخدم Earalyze لتحليل حالتك الأذنية واتخاذ إجراء مبكر.",
      "استخدام نظام Earalyze المدعوم بالذكاء الاصطناعي يمكن أن يساعدك في تشخيص أمراض الأذن بدقة وتتبع التغيرات في صحة أذنك بمرور الوقت.",
      "فقدان السمع المفاجئ قد يكون حالة خطيرة. إذا شعرت بتراجع سريع في السمع، استشر خبيرًا على الفور.",
      "الجلوس بشكل صحيح يمكن أن يقلل من الإجهاد على رقبتك ورأسك، مما يساعد في الوقاية من انزعاج الأذن، خاصة أثناء الجلسات الطويلة.",
      "البكتيريا والأوساخ قد تتراكم على السماعات. نظفها بانتظام لتجنب التهابات الأذن.",
      "النظام الغذائي المتوازن الغني بالفيتامينات مثل فيتامين E و B12 يدعم صحة الأعصاب، وهو أمر مهم للسمع."
     ];


  int adviceIndex = 0;
  late Timer timer;
  Future<int> changeAdvice() async {
    timer = Timer.periodic(const Duration(hours: 1), (timer) {
        setState(() {
          adviceIndex = (adviceIndex + 1) % messagesEn.length;

        });
    });
    return adviceIndex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeAdvice();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppPreferences.isDarkMode()
          ? ColorManager.whiteLight
          : ColorManager.primaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.whiteLight,
            width: 1),
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
                    S.of(context).tipOfTheDay,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: context.width * 0.038,
                        color: AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight),
                  ),
                  SizedBox(height: context.height * 0.004),
                  Text(
                      AppPreferences.getLanguageCode() == 'en'
                          ? messagesEn[adviceIndex]
                          : messagesAr[adviceIndex],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: context.width * 0.03,
                        color: AppPreferences.isDarkMode()
                            ? ColorManager.primaryDarkLight
                            : ColorManager.whiteLight),
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
