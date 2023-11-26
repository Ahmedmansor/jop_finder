part of 'apply_jop_cubit.dart';

@immutable
sealed class ApplyJopState {}

final class ApplyJopInitial extends ApplyJopState {}

//! -------------------------
class SelectRadioValueSucess extends ApplyJopState {}

//! -------------------------
class PickFileSucess extends ApplyJopState {}

class PickFileError extends ApplyJopState {}

//! -------------------------
class RemoveItemFromList extends ApplyJopState {}

class AddItemFromList extends ApplyJopState {}
