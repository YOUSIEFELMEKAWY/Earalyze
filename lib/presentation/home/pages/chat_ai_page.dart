import 'package:earalyze/presentation/home/cubits/chat_ai/chat_ai_cubit.dart';
import 'package:earalyze/presentation/home/cubits/chat_ai/chat_ai_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_dash_chat_widget.dart';

class ChatAiPage extends StatelessWidget {
  final User user;
  const ChatAiPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatAiCubit(user: user),
      child: BlocBuilder<ChatAiCubit, ChatAiStates>(
        builder: (context, state) {
          final chatAiCubit = context.read<ChatAiCubit>();
          return CustomDashChat(chatAiCubit: chatAiCubit);
        },
      ),
    );
  }
}

