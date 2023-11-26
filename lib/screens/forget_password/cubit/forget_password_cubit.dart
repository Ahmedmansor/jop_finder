import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  // forget password Screen validate form
  var keyForgetPassword = GlobalKey<FormState>();

  void validateFormFOrgetPassword({
    required String email,
  }) {
    if (keyForgetPassword.currentState!.validate()) {
      emit(ForgetPasswordValidState());
    } else {
      emit(ForgetPasswordInValidState());
    }
  }
}
