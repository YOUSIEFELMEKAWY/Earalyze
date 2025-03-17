import 'package:dash_chat_2/dash_chat_2.dart';

abstract class ChatAiStates{}

class ChatAiInitialState extends ChatAiStates{}

class SendMessageState extends ChatAiStates {
  final List<ChatMessage> messages; // Include messages in the state
  SendMessageState(this.messages);
}

class ChatErrorState extends ChatAiStates {
  final String errorMessage;
  ChatErrorState(this.errorMessage);
}

