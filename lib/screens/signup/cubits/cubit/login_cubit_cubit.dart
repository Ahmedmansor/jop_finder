import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/models/login_response.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';
import 'package:jobsque_job_finder/repos/shared_pref_helper.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  // login Screen validate form
  var keyLogin = GlobalKey<FormState>();

  void validateFormLogin({
    required String email,
    required String password,
  }) {
    if (keyLogin.currentState!.validate()) {
      emit(LoginValidState());
    } else {
      emit(LoginInValidState());
    }
  }

// login servece
  LoginResponse? user;

  login(String email, String password) async {
    emit(LoadingLoginState());

    await DioHelper.dio.post(loginEndPoint, data: {
      'email': email,
      'password': password,
    }).then((value) {
      if (value.data['status'] == true) {
        user = LoginResponse.fromJson(value.data);
        debugPrint(user!.token);

        CachMemory.insertToCachMemory(key: 'token', value: user!.token!);
        emit(SucessLoginState());
        debugPrint(
            'the token in cach is ${CachMemory.getFromCachMemory(key: 'token')}');
      } else {
        emit(ErrorLoginState(message: value.data['massage']));
        debugPrint('error to login ${value.data["message"]}');
      }
    }).catchError((error) {
      emit(ErrorLoginState(message: error.toString()));
      debugPrint(error.toString());
    });
  }

  //logout
  void logOut() {
    CachMemory.deleteFromCachMemory(key: 'token');
    emit(LogOutSucessState());
  }
}
