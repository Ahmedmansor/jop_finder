import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'main_complete_profile_state.dart';

class MainCompleteProfileCubit extends Cubit<MainCompleteProfileState> {
  MainCompleteProfileCubit() : super(MainCompleteProfileInitial());

  static MainCompleteProfileCubit get(context) => BlocProvider.of(context);

  //checkBox
  bool isChecked = false;
  void checkBox(value) {
    isChecked = value;
    emit(CheckBoxState());
  }

  //completeProfile
  double percent = 0.0;

  List<String> temp = [];
  void educationPresentageComplete() {
    // ignore: iterable_contains_unrelated_type
    if (temp.contains('Education')) {
      percent += 0.0;

      emit(RemoveEducationState());
    } else {
      temp.add('Education');
      percent += 0.5;

      emit(AddEducationState());
    }
    debugPrint(temp.toString());
  }

  void experiencePresentageComplete() {
    // ignore: iterable_contains_unrelated_type
    if (temp.contains('Experience')) {
      percent += 0.0;

      emit(RemoveExperienceState());
    } else {
      temp.add('Experience');
      percent += 0.5;

      emit(AddExperienceState());
    }
    debugPrint(temp.toString());
  }
}
