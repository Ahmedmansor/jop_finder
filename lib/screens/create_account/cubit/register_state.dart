part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

//! -------------------------
class RegisterValidState extends RegisterState {}

class RegisterInValidState extends RegisterState {}

//! -------------------------------
class LoadingRegisterState extends RegisterState {}

class SucessRegisterState extends RegisterState {}

// ignore: must_be_immutable
class ErrorRegisterState extends RegisterState {
  String message;
  ErrorRegisterState({required this.message});
}

//! -------------------------------
class ChangeVisabilityState extends RegisterState {}

//! -------------------------------
class RemoveIconState extends RegisterState {}

class AddIconState extends RegisterState {}

//! -------------------------------
class AddLocationState extends RegisterState {}

class RemoveLocationState extends RegisterState {}
