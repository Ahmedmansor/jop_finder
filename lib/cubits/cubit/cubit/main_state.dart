part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

//! -------------------------
class LoadingGetAllJobsState extends MainState {}

class SucessGetAllJobsState extends MainState {}

class ErrorGetAllJobsState extends MainState {}

//! -------------------------
class WorkFilterJobsState extends MainState {}

//! -------------------------
class LoadingSearchJobsState extends MainState {}

class SucessSearchJobsState extends MainState {}

class ErrorSearchJobsState extends MainState {}

//! -------------------------
class ChangeSubmittedState extends MainState {}

//! -------------------------
class LoadingFilterJobsState extends MainState {}

class SucessFilterJobsState extends MainState {}

class ErrorFilterJobsState extends MainState {}

//! -------------------------
class AddOnSiteState extends MainState {}

class RemoveOnSiteState extends MainState {}

//! -------------------------
class SucessGetSavedState extends MainState {}

class ErrorGetSavedState extends MainState {}

class LoadingGetSavedState extends MainState {}

//! -------------------------
class LoadingAddSaveItem extends MainState {}

class SucessAddSaveItem extends MainState {}

class ErrorAddSaveItem extends MainState {}

//! -------------------------
class LoadingRemoveSaveItem extends MainState {}

class SucessRemoveSaveItem extends MainState {}

class ErrorRemoveSaveItem extends MainState {}

//! -------------------------
class SucessAddOrRemoveSaveItemsState extends MainState {}

//! -------------------------
class LoadingUserSentMessageState extends MainState {}

class SucessUserSentMessageState extends MainState {}

class ErrorUserSentMessageState extends MainState {}

//! -------------------------
class LoadingGetChatState extends MainState {}

class SucessGetChatState extends MainState {}

class ErrorGetChatState extends MainState {}

//! -------------------------
class LoadingApplyedJopsState extends MainState {}

class SucessApplyedJopsState extends MainState {}

class ErrorApplyedJopsState extends MainState {}
