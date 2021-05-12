

import 'package:dio/dio.dart';

class Retro_Api {

  Dio Dio_Data()
   {
    final dio = Dio();
    dio.options.headers["Accept"] = "application/json";   // config your dio headers globally
    dio.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    // dio.options.followRedirects = false;

    return dio;
   }
}