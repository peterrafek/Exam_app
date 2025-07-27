import 'package:exam_app/core/result.dart';

abstract class ApiExecutor {
  static Future<Result<T>> executeApi<T>(
    Future<T> Function() apiCall,
  ) async {
    try {
      var result = await apiCall.call();
      return Success(data: result);
    } catch (error) {
      return Error(exception: error);
    }
  }
}
