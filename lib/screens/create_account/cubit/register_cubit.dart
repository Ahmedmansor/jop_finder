import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  // register Screen validate form
  var keyRegister = GlobalKey<FormState>();

  void validateFormRegister({
    required String username,
    required String email,
    required String password,
  }) {
    if (keyRegister.currentState!.validate()) {
      emit(RegisterValidState());
    } else {
      emit(RegisterInValidState());
    }
  }

  // register Servece
  register(String username, String email, String password) async {
    emit(LoadingRegisterState());
    await DioHelper.dio.post(registerEndPoint, data: {
      'name': username,
      'email': email,
      'password': password,
    }).then((value) {
      if (value.data['status'] == true) {
        debugPrint('register sucess 200');
        emit(SucessRegisterState());
      } else {
        emit(ErrorRegisterState(message: value.data['message']));
        debugPrint(value.data['message']);
      }
    }).catchError((error) {
      emit(ErrorRegisterState(message: error.toString()));

      debugPrint(
        error.toString(),
      );
    });
  }

  // chang visability
  bool isPassword = true;
  void changeVisablity() {
    isPassword = !isPassword;
    emit(ChangeVisabilityState());
  }

//!------------------------------------------------------------------------
  //what type of work are you interested in ?
  List<String> iconsName = [
    'Ui/UX Desinger',
    'llustrator Designer',
    'Developer',
    'Managment',
    'Information\nTechnology',
    'Research and\nAnalytics',
  ];

  List<String> icons = [
    'assets/Icons_what_type_of_work/Ilustrator _desinger.png',
    'assets/Icons_what_type_of_work/Ilustrator _desinger.png',
    'assets/Icons_what_type_of_work/Developer.png',
    'assets/Icons_what_type_of_work/Management .png',
    'assets/Icons_what_type_of_work/Information technology.png',
    'assets/Icons_what_type_of_work/Ilustrator _desinger.png'
  ];
  List<String> temp = [];
  void whatTypeOfWorkAreYouInterestedIn(index) {
    // ignore: iterable_contains_unrelated_type
    if (temp.contains(iconsName[index])) {
      temp.remove(iconsName[index]);
      emit(RemoveIconState());
    } else {
      temp.add(iconsName[index]);
      emit(AddIconState());
    }
    debugPrint(temp.toString());
  }

//!------------------------------------------------------------------------
  //Where are you profered
  List<String> options = [
    'United States',
    'Malaysia',
    'Singapore',
    'Indonesia',
    'Philiphines',
    'Polandia',
    'India',
    'Vietnam',
    'China',
    'Canada',
    'Saudi Arabia',
    'Argentina',
    'Brazil'
  ];
  List<String> flagsNames = [
    'US',
    'MY',
    'SG',
    'ID',
    'PH',
    'PL',
    'IN',
    'VN',
    'CN',
    'CA',
    'SA',
    'AR',
    'BR'
  ];
  Set<int> selectedValues = <int>{};

  //selected location function
  void selectedLocation(bool selected, index) {
    if (selected) {
      selectedValues.add(index);
      emit(AddLocationState());
    } else {
      selectedValues.remove(index);
      emit(RemoveLocationState());
    }
    debugPrint(selectedValues.length.toString());
  }
}
