import 'package:earalyze/presentation/forget_password/cubits/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/services/firebase_services.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  bool isLoading = false;
  Future<void> sendPasswordResetEmail({context, required String email}) async {
    emit(ForgetPasswordLoading());
    isLoading = true;
    try {
      await FirebaseServices().sendPasswordResetEmail(context, email);
      emit(ForgetPasswordSuccess());
      isLoading = false;
    } on Exception {
      emit(ForgetPasswordFailure());
      isLoading = false;
    }
  }
}
