import 'package:dio/dio.dart';
import 'package:exam_app/core/result.dart';

import '../data/api/base_server_error.dart';
import 'exceptions.dart';

abstract class ApiExecutor {
  static Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
    try {
      var result = await apiCall.call();
      return Success(data: result);
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.badCertificate:
          {
            return Error(
                errorMessage: e.type.name,
                exception: NetworkError(e.message ?? 'Network error occurred'));
          }
        default:
          {
            if (e.response?.data != null) {
              var serverError = BaseServerError.fromJson(e.response?.data);
              return Error(
                  errorMessage: e.type.name,
                  exception: ServerError(
                      serverError.message ?? 'Server error occurred'));
            }
            return Error(
                errorMessage: e.type.name,
                exception: ServerError(e.message ?? 'Server error occurred'));
          }
      }
    }
  }
}
