import 'package:dio/dio.dart';
import 'package:jobsque_job_finder/repos/end_points.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    );
  }
}
