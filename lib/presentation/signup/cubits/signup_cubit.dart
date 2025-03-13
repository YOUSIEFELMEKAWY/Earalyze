import 'package:earalyze/presentation/signup/cubits/signup_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/firebase_services.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(SignupInitial());

  bool isLoading = false;
  Future<void> signup(
      {context, required String email, required String password}) async {
    emit(SignupLoading());
    isLoading = true;
    try {
      await FirebaseServices().signupUser(context, email, password);
      emit(SignupSuccess());
      isLoading = false;
    } on Exception  {
      emit(SignupFailure());
      isLoading = false;
    }
  }
}
