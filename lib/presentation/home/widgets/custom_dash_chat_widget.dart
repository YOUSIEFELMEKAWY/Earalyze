import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/strings_manager.dart';
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
        currentUserContainerColor: Colors
            .blue[100],
        currentUserTextColor:
        Colors.black,
        containerColor:
        Colors.grey[200]!,
        textColor: Colors.black,
        messagePadding: const EdgeInsets.all(12),
        borderRadius: 18.0,
        showTime: true,
      ),
      currentUser: chatAiCubit.chatUser,
      onSend: (ChatMessage chatMessage) async{
        await chatAiCubit.talkWithGemini(chatMessage);
      },
      messages: chatAiCubit.messages,
      inputOptions: InputOptions(
        inputDecoration: InputDecoration(
          hintText: AppStrings.writeAMessage,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: ColorManager.primaryDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: ColorManager.lightGray),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(color: ColorManager.primaryDark),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding
        ),
        inputTextStyle: TextStyle(color: ColorManager.primaryDark),
      ),
    );
  }
}