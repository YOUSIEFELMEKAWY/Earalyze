abstract class ChatAiStates {}

class ChatAiInitialState extends ChatAiStates {}

class SendMessageState extends ChatAiStates {}

class ChatErrorState extends ChatAiStates {
  final String errorMessage;
  ChatErrorState(this.errorMessage);
}
