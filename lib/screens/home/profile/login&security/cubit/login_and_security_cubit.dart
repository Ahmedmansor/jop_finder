import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';

part 'login_and_security_state.dart';

class LoginAndSecurityCubit extends Cubit<LoginAndSecurityState> {
  LoginAndSecurityCubit() : super(LoginAndSecurityInitial());

  static LoginAndSecurityCubit get(context) => BlocProvider.of(context);

//PhoneNumberScreen*****************************
  bool phoneNumberScreen = false;
  void changephoneNumberScreen(value) {
    phoneNumberScreen = value;
    emit(ChangePhoneNumberState());
  }

  // Change password validate form
  var keyChangePassword = GlobalKey<FormState>();

  void validateFormLoginAndSecurity({
    required String oldPassword,
    required String newPassword,
    required String reNewPassword,
  }) {
    if (keyChangePassword.currentState!.validate()) {
      emit(ChangePasswordValidState());
    } else {
      emit(ChangePasswordInValidState());
    }
  }

  //Change Password Service
  updatePassword({required String password, required String name}) async {
    emit(LoadingEditPasswordState());

    await DioHelper.dio
        .post(
      updateNameAndPassword,
      data: {'password': password, 'name': name},
      options: Options(
        headers: {'Authorization': 'Bearer ${token!}'},
      ),
    )
        .then((value) {
      if (value.data['status'] == true) {
        // debugPrint(value.data);
        debugPrint('Password Changed Sucessfully');
        emit(SucessEditPasswordState());
      } else {
        emit(ErrorEditPasswordState(errorMessage: value.data['massage']));
        debugPrint('Error');
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  //change password visability
  bool oldPassword = true;
  changeOldPasswordVisability() {
    oldPassword = !oldPassword;
    emit(ChangePasswordVisabilityState());
  }

  bool newPassword = true;
  changeNewPasswordVisability() {
    newPassword = !newPassword;
    emit(ChangePasswordVisabilityState());
  }

  bool reNewPassword = true;
  changeReNewPasswordVisability() {
    reNewPassword = !reNewPassword;
    emit(ChangePasswordVisabilityState());
  }

  //Two STep Verification Switch
  bool twoStepVerificationSwitch = false;
  changeTwoStepVerificationSwitch(value) {
    twoStepVerificationSwitch = value;
    emit(changeTwoStepVerificationSwitchState());
  }
}
