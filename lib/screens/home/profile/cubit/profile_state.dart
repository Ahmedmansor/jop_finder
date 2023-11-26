part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

//! -------------------------
class LoadingGetProfileState extends ProfileState {}

class SucessGetProfileState extends ProfileState {}

class ErrorGetProfileState extends ProfileState {}

//! -------------------------
class ChangeEditAboutState extends ProfileState {}

//! -------------------------
class ChangeLanguage extends ProfileState {}

//! -------------------------
class ChangeNotificationState extends ProfileState {}
