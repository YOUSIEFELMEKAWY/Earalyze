import 'package:earalyze/app/constants.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import 'chat_ai_states.dart';

class ChatAiCubit extends Cubit<ChatAiStates> {
  final User user;
  late final ChatUser chatUser;

  ChatAiCubit({required this.user}) : super(ChatAiInitialState()) {
    chatUser = ChatUser(
      id: user.uid,
      firstName: user.displayName ?? 'User',
      profileImage: user.photoURL,
    );

  }

  List<ChatMessage> messages = [];
  final _bot = ChatUser(id: '0', firstName: 'Earalyze Bot');

  Future<void> talkWithGemini(ChatMessage message) async
  {
    messages.insert(0, message);
    emit(SendMessageState(messages));
    final model = GenerativeModel(model: 'gemini-2.0-flash',apiKey: Constants.geminiApiKey);
    final content = Content.text(message.text);
    final response = await model.generateContent([content]);


      messages.insert(
        0,
        ChatMessage(
          text: response.text!,
          user: _bot,
          createdAt: DateTime.now(),
        ),
      );

      emit(SendMessageState(messages));

    }
  }

