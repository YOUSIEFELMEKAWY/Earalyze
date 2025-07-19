import 'package:earalyze/presentation/signup/cubits/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/services/firebase_services.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitial());

  bool isLoading = false;
  Future<void> signup(
      {context,
      required String email,
      required String password,
      required String firstName,
      required String lastName}) async {
    emit(SignupLoading());
    isLoading = true;
    try {
      await FirebaseServices()
          .signupUser(context, email, password, firstName, lastName);
      emit(SignupSuccess());
      isLoading = false;
    } on Exception {
      emit(SignupFailure());
      isLoading = false;
    }
  }

  Future<void> launchTerms() async {
    final Uri url = Uri.parse('https://yourwebsite.com/terms');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchPrivacyPolicy() async {
    final Uri url = Uri.parse('https://yourwebsite.com/privacy');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
