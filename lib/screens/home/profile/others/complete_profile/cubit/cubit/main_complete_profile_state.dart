part of 'main_complete_profile_cubit.dart';

@immutable
sealed class MainCompleteProfileState {}

final class MainCompleteProfileInitial extends MainCompleteProfileState {}

//! -------------------------
class CheckBoxState extends MainCompleteProfileState {}

//! -------------------------
class RemoveEducationState extends MainCompleteProfileState {}

class AddEducationState extends MainCompleteProfileState {}

//! -------------------------
class RemoveExperienceState extends MainCompleteProfileState {}

class AddExperienceState extends MainCompleteProfileState {}
