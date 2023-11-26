import 'package:flutter/material.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/repos/dio_helper.dart';
import 'package:jobsque_job_finder/repos/shared_pref_helper.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'root/app_root.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppSettings.init;
  await DioHelper.init();
  await CachMemory.cachMemoryInit();
  token = CachMemory.getFromCachMemory(key: 'token');

  runApp(const AppRoot());
}
