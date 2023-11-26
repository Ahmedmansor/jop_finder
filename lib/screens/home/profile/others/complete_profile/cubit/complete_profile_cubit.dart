import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit()
      : super(
          CompleteProfileInitial(
            EducationCompleteState(
                university: '', title: '', startYear: '', endYear: ''),
            ExperienceCompleteState(
                position: '',
                typeOfWork: '',
                companyName: '',
                location: '',
                startYear: ''),
          ),
        );

  static CompleteProfileCubit get(context) => BlocProvider.of(context);

  void updateEducation({
    required String university,
    required String title,
    required String startYear,
    required String endYear,
  }) {
    emit(EducationCompleteState(
      university: university,
      title: title,
      startYear: startYear,
      endYear: endYear,
    ));
  }

  void updateExperience(
      {required String position,
      required String typeOfWork,
      required String companyName,
      required String location,
      required String startYear}) {
    emit(ExperienceCompleteState(
      position: position,
      typeOfWork: typeOfWork,
      companyName: companyName,
      location: location,
      startYear: startYear,
    ));
  }
}
