import 'package:flutter_bloc/flutter_bloc.dart';
import 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordState(defaultShowPassword: true));

  void togglePasswordVisibility() {
    final newState = ShowPasswordState(
      defaultShowPassword: !state.defaultShowPassword,
    );
    emit(newState);
  }
}