import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../core/di.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Dio> provideDio() async {
    final Dio dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        baseUrl: 'https://exam.elevateegy.com/api/',
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
        logPrint: (object) {
          debugPrint(object.toString());
        },
      ),
    );

    return dio;
  }
}

extension DioServiceExtension on RegisterModule {
  static void updateDioWithToken(String token) {
    Dio dio = getIt.get<Dio>();
    BaseOptions newBaseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      baseUrl: 'https://exam.elevateegy.com/api/',
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
