part of 'complete_profile_cubit.dart';

sealed class CompleteProfileState {}

final class CompleteProfileInitial extends CompleteProfileState {
  CompleteProfileInitial(EducationCompleteState educationCompleteState,
      ExperienceCompleteState experienceCompleteState);
}

//! -------------------------
class EducationCompleteState extends CompleteProfileState {
  final String university;
  final String title;
  final String startYear;
  final String endYear;

  EducationCompleteState({
    required this.university,
    required this.title,
    required this.startYear,
    required this.endYear,
  });
}

//! -------------------------
class ExperienceCompleteState extends CompleteProfileState {
  final String position;
  final String typeOfWork;
  final String companyName;
  final String location;
  final String startYear;

  ExperienceCompleteState(
      {required this.position,
      required this.typeOfWork,
      required this.companyName,
      required this.location,
      required this.startYear});
}
