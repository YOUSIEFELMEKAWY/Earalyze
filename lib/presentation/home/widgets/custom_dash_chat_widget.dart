import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/local/app_preferences.dart';
import '../../../generated/l10n.dart';
import '../../resources/color_manager.dart';
import '../cubits/chat_ai/chat_ai_cubit.dart';

class CustomDashChat extends StatelessWidget {
  const CustomDashChat({
    super.key,
    required this.chatAiCubit,
  });

  final ChatAiCubit chatAiCubit;

  @override
  Widget build(BuildContext context) {
    return DashChat(
      messageOptions: MessageOptions(
        showCurrentUserAvatar: true,
        showOtherUsersAvatar: true,
        showOtherUsersName: true,
        currentUserContainerColor: AppPreferences.isDarkMode()
            ? Colors.blue[100]
            : ColorManager.blueLight,
        currentUserTextColor: AppPreferences.isDarkMode()
            ? ColorManager.blackLight
            : ColorManager.blackDarkMode,
        containerColor: AppPreferences.isDarkMode()
            ? Colors.grey[200]!
            : ColorManager.grayLight,
        textColor: AppPreferences.isDarkMode()
            ? ColorManager.blackLight
            : ColorManager.blackDarkMode,
        messagePadding: const EdgeInsets.all(12),
        borderRadius: 18.0,
        showTime: true,
      ),
      currentUser: chatAiCubit.chatUser,
      onSend: (ChatMessage chatMessage) async {
        await chatAiCubit.talkWithGemini(chatMessage);
      },
      messages: chatAiCubit.messages,
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hintText: S.of(context).writeAMessage,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.primaryDarkLight
                    : ColorManager.primaryDarkDarkMode),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.lightGrayLight
                    : ColorManager.lightGrayDarkMode),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: AppPreferences.isDarkMode()
                    ? ColorManager.primaryDarkLight
                    : ColorManager.primaryDarkDarkMode),
          ),
          filled: true,
          fillColor:
              AppPreferences.isDarkMode() ? Colors.grey[100] : Colors.grey[300],
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding
        ),
        inputTextStyle: TextStyle(
            color: AppPreferences.isDarkMode()
                ? ColorManager.primaryDarkLight
                : ColorManager.primaryDarkDarkMode),
      ),
    );
  }
}
