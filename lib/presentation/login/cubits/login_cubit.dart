import 'package:earalyze/presentation/login/cubits/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/services/firebase_services.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());

  bool isLoading = false;
  Future<void> login(
      {context, required String email, required String password}) async {
    emit(LoginLoading());
    isLoading = true;
    try {
      await FirebaseServices().signInUser(context, email, password);
      emit(LoginSuccess());
      isLoading = false;
    } on Exception {
      emit(LoginFailure());
      isLoading = false;
    }
  }
}
