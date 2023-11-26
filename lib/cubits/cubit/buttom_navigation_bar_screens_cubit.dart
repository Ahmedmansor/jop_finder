import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/home/applyed_jops/applied_page.dart';
import 'package:jobsque_job_finder/screens/home/home.dart';
import 'package:jobsque_job_finder/screens/home/messages/messages.dart';
import 'package:jobsque_job_finder/screens/home/profile/profile.dart';
import 'package:jobsque_job_finder/screens/home/saved_page.dart';
import 'package:meta/meta.dart';

part 'buttom_navigation_bar_screens_state.dart';

class ButtomNavigationBarScreensCubit
    extends Cubit<ButtomNavigationBarScreensState> {
  ButtomNavigationBarScreensCubit()
      : super(ButtomNavigationBarScreensInitial());
  static ButtomNavigationBarScreensCubit get(context) =>
      BlocProvider.of(context);

  int index = 0;
  List<Widget> screens = [
    HomeScreen(),
    MessagesPage(),
    AppliedPage(),
    SavedPage(),
    Profile(),
  ];

  void changeScreen(i) {
    index = i;
    emit(ChangeScreenState());
  }
}
