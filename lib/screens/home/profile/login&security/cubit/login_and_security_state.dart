part of 'login_and_security_cubit.dart';

@immutable
sealed class LoginAndSecurityState {}

final class LoginAndSecurityInitial extends LoginAndSecurityState {}

//! -------------------------
class ChangePhoneNumberState extends LoginAndSecurityState {}

//! -------------------------
class ChangePasswordValidState extends LoginAndSecurityState {}

class ChangePasswordInValidState extends LoginAndSecurityState {}

//! -------------------------
class LoadingEditPasswordState extends LoginAndSecurityState {}

class SucessEditPasswordState extends LoginAndSecurityState {}

class ErrorEditPasswordState extends LoginAndSecurityState {
  String? errorMessage;
  ErrorEditPasswordState({required this.errorMessage});
}

//! -------------------------
class ChangePasswordVisabilityState extends LoginAndSecurityState {}

//! -------------------------
class changeTwoStepVerificationSwitchState extends LoginAndSecurityState {}
