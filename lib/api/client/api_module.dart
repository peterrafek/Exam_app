import 'package:dio/dio.dart';
import 'package:exam_app/api/client/api_end_points.dart';
 import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../di/di.dart';


@module
abstract class ApiModule {
  @preResolve
  Future<Dio> provideDio() async {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: ApiEndPoints.baseUrl,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth:90 ,
        enabled: kDebugMode,

        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    return dio;
  }
}

extension DioServiceExtension on ApiModule {
  static void updateDioWithToken(String token) {
    Dio dio = getIt.get<Dio>();
    BaseOptions newBaseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      baseUrl: ApiEndPoints.baseUrl,
      headers: {
        "token": token,
        'Accept': 'application/json',
      },
    );
    dio.options = newBaseOptions;
  }

  static void clearDefaultHeaders() {
    Dio dio = getIt.get<Dio>();
    dio.options.headers.clear();
  }

  static void setHeadersToDefault(String token) {
    Dio dio = getIt.get<Dio>();
    dio.options.headers = {
      "Authorization": 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
}
