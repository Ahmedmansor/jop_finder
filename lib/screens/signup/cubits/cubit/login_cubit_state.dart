part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

//! -------------------------
class LoginValidState extends LoginCubitState {}

class LoginInValidState extends LoginCubitState {}

//!  ------------------------------
class LoadingLoginState extends LoginCubitState {}

class SucessLoginState extends LoginCubitState {}

// ignore: must_be_immutable
class ErrorLoginState extends LoginCubitState {
  String message;
  ErrorLoginState({required this.message});
}

//!  ------------------------------
class LogOutSucessState extends LoginCubitState {}
