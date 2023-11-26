import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/models/profile_response.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  //get Profile Data
  ProfileResponse? profile;
  getProfile() async {
    emit(LoadingGetProfileState());
    await DioHelper.dio
        .get(getprofileEndPoint,
            options: Options(headers: {
              'Authorization': 'Bearer ${token!}',
            }))
        .then((value) {
      if (value.statusCode == 200) {
        debugPrint('200');
        profile = ProfileResponse.fromJson(value.data);
        debugPrint(profile!.data!.name);
        emit(SucessGetProfileState());
      } else {
        emit(ErrorGetProfileState());
        debugPrint('error Something Wrong ***');
      }
    }).catchError((error) {
      emit(ErrorGetProfileState());
      debugPrint(error.toString());
    });
  }

  String about =
      'I\'m Rafif Dian Axelingga, I’m UI/UX Designer, I have\nexperience designing UI Design for approximately 1\nyear. I am currently joining the Vektora studio team\nbased in Surakarta, Indonesia.I am a person who has a\nhigh spirit and likes to work to achieve what I dream of.';
  var aboutController = TextEditingController();
  void editAbout() {
    about = aboutController.text;
    emit(ChangeEditAboutState());
  }

  //language*****************************
  String? type;
  void changeLanguage(value) {
    type = value;
    debugPrint(value);
    emit(ChangeLanguage());
  }

  //Notification*****************************
  bool yourJobSearchAlert = true;
  bool jobApplicationUpdate = false;
  bool jobApplicationReminders = true;
  bool jobsYouMayBeInterestedIn = true;
  bool jobSeekerUpdates = false;
  bool showProfile = false;
  bool allMessage = true;
  bool messageNudges = false;

  void changeyourJobSearchAlert(value) {
    yourJobSearchAlert = value;
    emit(ChangeNotificationState());
  }

  void changejobApplicationUpdate(value) {
    jobApplicationUpdate = value;
    emit(ChangeNotificationState());
  }

  void changejobApplicationReminders(value) {
    jobApplicationReminders = value;
    emit(ChangeNotificationState());
  }

  void changejobsYouMayBeInterestedIn(value) {
    jobsYouMayBeInterestedIn = value;
    emit(ChangeNotificationState());
  }

  void changejobSeekerUpdates(value) {
    jobSeekerUpdates = value;
    emit(ChangeNotificationState());
  }

  void changeshowProfile(value) {
    showProfile = value;
    emit(ChangeNotificationState());
  }

  void changeallMessage(value) {
    allMessage = value;
    emit(ChangeNotificationState());
  }

  void changemessageNudges(value) {
    messageNudges = value;
    emit(ChangeNotificationState());
  }
}
