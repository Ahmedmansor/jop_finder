import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/models/apply_jop_response.dart';
import 'package:jobsque_job_finder/models/chat_response.dart';
import 'package:jobsque_job_finder/models/jobs_response.dart';
import 'package:jobsque_job_finder/models/login_response.dart';
import 'package:jobsque_job_finder/models/saved_response.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';

import '../../../repos/const.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  LoginResponse? user;

  // login(String email, String password) async {
  //   emit(LoadingLoginState());

  //   await DioHelper.dio.post(loginEndPoint, data: {
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     if (value.statusCode == 200) {
  //       emit(SucessLoadingState());

  //       user = LoginResponse.fromJson(value.data);
  //       print(user!.token);

  //       CachMemory.insertToCachMemory(key: 'token', value: user!.token!);
  //       print('the token in cach is ' +
  //           CachMemory.getFromCachMemory(key: 'token'));
  //     } else {
  //       emit(ErrorLoadingState());
  //       print(value.data);
  //     }
  //   }).catchError((error) {
  //     emit(ErrorLoadingState());
  //     print(error.toString());
  //   });
  // }

  // register(String name, String email, String password) async {
  //   emit(LoadingRegisterState());
  //   await DioHelper.dio.post(registerEndPoint, data: {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     emit(SucessRegisterState());
  //     if (value.statusCode == 200) {
  //       print(value.data);
  //     } else {
  //       emit(ErrorRegisterState());
  //     }
  //   }).catchError((error) {
  //     emit(ErrorRegisterState());

  //     print(
  //       error.toString(),
  //     );
  //   });
  // }

  bool isSubmitted = false;
  void submitted() {
    isSubmitted = !isSubmitted;
    emit(ChangeSubmittedState());
  }

  // updatePassword(String password) async {
  //   emit(LoadingEditPasswordState());

  //   await DioHelper.dio
  //       .post(
  //     updateNameAndPassword,
  //     data: {
  //       'password': password,
  //     },
  //     options: Options(
  //       headers: {'Authorization': 'Bearer ${user!.token!}'},
  //     ),
  //   )
  //       .then((value) {
  //     if (value.statusCode == 200) {
  //       emit(SucessEditPasswordState());
  //       debugPrint(value.data);
  //       debugPrint('Sucess');
  //     } else {
  //       emit(ErrorEditPasswordState());
  //       debugPrint('Error');
  //     }
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //   });
  // }

//getAllJobs
  List<JopDataModel> jobs = [];
  JobsResponse? jobsResponse;

  getJobs() async {
    jobs = [];
    emit(LoadingGetAllJobsState());

    await DioHelper.dio
        .get(
      getAlljobsEndPoint,
      options: Options(headers: {
        // 'Authorization': 'Bearer ${user!.token!}',
        'Authorization': 'Bearer ${token!}',
      }),
    )
        .then((value) {
      if (value.statusCode == 200) {
        emit(SucessGetAllJobsState());
        debugPrint('200 get all jobs');

// علشان الموديل فيه لوب اصلاً علي الليست الي جواها
// اسمهاداتا فمش محتاج اعمل ليست و اعمل لوب علشان ااحط فيها العناصر
        // jobsResponse = JobsResponse.fromJson(value.data);
        for (var element in value.data['data']) {
          jobs.add(JopDataModel.fromJson(element));
          debugPrint(jobs.length.toString());
          // debugPrint(jobsResponse);
        }
      } else {
        emit(ErrorGetAllJobsState());
        print('error');
      }
    }).catchError((error) {
      emit(ErrorGetAllJobsState());
      print(error.toString());
    });
  }

  // //filtered jobs for search
  // JobsResponse? jobsResponse1;
  // List<JopDataModel> filteredJobsList = [];

  // void filteredJobs({required String input}) {
  //   List<JopDataModel> allJobs = jobsResponse1!.data!;

  //   filteredJobsList = allJobs
  //       .where((element) =>
  //           element.name!.toLowerCase().startsWith(input.toLowerCase()))
  //       .toList();
  //   emit(SucessFilterJobsState());
  // }

  //filterjobs
  List<JopDataModel> filterJobsList = [];

  void filterJobs({String? jopTitle, location, salary}) async {
    filterJobsList = [];
    emit(LoadingFilterJobsState());
    await DioHelper.dio.post(jopFilterEndPoint,
        options: Options(headers: {
          'Authorization': 'Bearer ${token!}',
        }),
        data: {
          'name': jopTitle,
          'location': location,
          'salary': salary,
        }).then((value) {
      if (value.data['status'] == true) {
        debugPrint('filterJobs sucess 200');

        for (var element in value.data['data']) {
          filterJobsList.add(JopDataModel.fromJson(element));
          debugPrint('filterJobsList length = ${filterJobsList.length}');
        }
        emit(SucessFilterJobsState());
      } else {
        emit(ErrorFilterJobsState());
        debugPrint("filterJobs error");
      }
    }).catchError((error) {
      emit(ErrorFilterJobsState());

      debugPrint(error.toString());
    });
  }

  //search jop
  List<JopDataModel> searchList = [];

  searchJop(String name) async {
    emit(LoadingSearchJobsState());
    searchList = [];
    await DioHelper.dio.post(searchJopEndPoint,
        options: Options(headers: {
          'Authorization': 'Bearer ${token!}',
        }),
        data: {
          'name': name,
        }).then((value) {
      if (value.data['status'] == true) {
        debugPrint('searchJop sucess 200');
        // jobsResponse1 = JobsResponse.fromJson(value.data);
        for (var element in value.data['data']) {
          searchList.add(JopDataModel.fromJson(element));

          // debugPrint(element);
          debugPrint('searchList length = ${searchList.length}');
        }
        emit(SucessSearchJobsState());
      } else {
        emit(ErrorSearchJobsState());

        debugPrint('error in searchJop ');
      }
    }).catchError((error) {
      emit(ErrorSearchJobsState());

      debugPrint(error.toString());
    });
  }

  //Home Screen On Site/Remote
  List<String> options = ['Remote', 'Onsite', 'Hybird', 'Any'];
  Set<int> selectedValues = <int>{};

  //selected location function
  void selectedLocation(bool selected, index) {
    if (selected) {
      selectedValues.add(index);
      emit(AddOnSiteState());
    } else {
      selectedValues.remove(index);
      emit(RemoveOnSiteState());
    }
    debugPrint(selectedValues.length.toString());
  }

// Get All saved jobs Service
  List<SavedData> savedItems = [];
  Set<String> savedItemsId = {};

  getAllSavedJobs() async {
    savedItems = [];
    emit(LoadingGetSavedState());
    await DioHelper.dio
        .get(showAllSavedEndPoint,
            options: Options(headers: {
              'Authorization': 'Bearer ${token!}',
            }))
        .then((value) {
      if (value.data['status'] == true) {
        debugPrint('in All savedItems');

        for (var element in value.data['data']) {
          savedItems.add(SavedData.fromJson(element));
          // debugPrint(element);
          debugPrint('savedItems length = ${savedItems.length}');

          savedItemsId.add(element['jobs']['id'].toString());
          debugPrint('savedItemsId length = ${savedItemsId.length}');
        }
        emit(SucessGetSavedState());
      } else {
        emit(ErrorGetSavedState());
        debugPrint('ErrorGetsavedItems');
      }
    });
  }

//add save item service
  addSaveItem({required String jobID}) async {
    emit(LoadingAddSaveItem());

    await DioHelper.dio.post(showAllSavedEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token!}',
          },
        ),
        data: {
          'job_id': jobID,
        }).then((value) async {
      if (value.data['status'] == true) {
        debugPrint('Saved Item Added');

        emit(SucessAddSaveItem());
        await getAllSavedJobs();
      } else {
        debugPrint('ErrorAddSaveItem');
        emit(ErrorAddSaveItem());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

//remove saved item service
  removeSaveItem({required String id}) async {
    emit(LoadingRemoveSaveItem());

    await DioHelper.dio
        .delete(
      removeSavedItemEndPoint + id,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token!}',
        },
      ),
    )
        .then((value) {
      if (value.data['status'] == true) {
        emit(SucessRemoveSaveItem());
        // savedItemsId.remove(id.toString());

        debugPrint('Saved Item REmoved ${savedItemsId.toString()}');
        getAllSavedJobs();
      } else {
        debugPrint('ErrorAddSaveItem');
        emit(ErrorRemoveSaveItem());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

//add or remove save item service
  addOrRemoveSaveItem({required String jobID}) async {
    emit(LoadingAddSaveItem());

    await DioHelper.dio.post(showAllSavedEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token!}',
          },
        ),
        data: {
          'job_id': jobID,
        }).then((value) async {
      if (value.data['status'] == true) {
        if (savedItemsId.contains(jobID) == true) {
          savedItemsId.remove(jobID);
        } else {
          savedItemsId.add(jobID);
        }
        getAllSavedJobs();
        emit(SucessAddOrRemoveSaveItemsState());
      } else {
        debugPrint('ErrorAddSaveItem');
        emit(ErrorAddSaveItem());
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  //Messages//////////////////////////////
  //user Sent Message service
  userSentMessage({required String compId, required String message}) async {
    emit(LoadingUserSentMessageState());
    await DioHelper.dio.post(chatEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token!}',
          },
        ),
        data: {
          'user_id': '1',
          'comp_id': compId,
          'massage': message
        }).then((value) {
      if (value.data['status'] == true) {
        emit(SucessUserSentMessageState());
        debugPrint('user Send message sucess');
      } else {
        debugPrint('user faild to send message');
        emit(ErrorUserSentMessageState());
      }
    }).catchError((error) {
      emit(ErrorUserSentMessageState());

      debugPrint(error.toString());
    });
  }

  //Get Chat Service
  List<ChatData> chatList = [];
  getChat({required String compId}) async {
    emit(LoadingGetChatState());
    await DioHelper.dio.get(chatEndPoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${token!}',
          },
        ),
        queryParameters: {'user_id': '1', 'comp_id': compId}).then((value) {
      if (value.data['status'] == true) {
        debugPrint('in get chat');

        for (var element in value.data['data']) {
          chatList.add(ChatData.fromJson(element));
        }
        emit(SucessGetChatState());
      } else {
        emit(ErrorGetChatState());

        debugPrint('error in get chat');
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  //get Apply jop
  List<ApplyedJopsData> appliedJobList = [];
  void getApplyJop() async {
    emit(LoadingApplyedJopsState());

    await DioHelper.dio
        .get(
      showApplyJopEndPoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${token!}',
        },
      ),
    )
        .then((value) {
      if (value.data['status'] == true) {
        debugPrint('in get Apply jop');
        for (var element in value.data['data']) {
          appliedJobList.add(ApplyedJopsData.fromJson(element));
        }
        emit(SucessApplyedJopsState());
      } else {
        emit(ErrorApplyedJopsState());
        debugPrint('error in get Apply jop');
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
