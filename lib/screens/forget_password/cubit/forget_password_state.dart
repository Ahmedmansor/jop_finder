part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

//! -------------------------
class ForgetPasswordValidState extends ForgetPasswordState {}

class ForgetPasswordInValidState extends ForgetPasswordState {}
