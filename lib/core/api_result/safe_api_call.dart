import 'package:exam_app/core/api_result/api_result.dart';

Future<ApiResult<T>> SafeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final response = await apiCall();
    return OnSuccess<T>(data: response);
  } catch (e) {
    return OnFailure<T>(
      exception: e is Exception ? e : Exception(e.toString()),
    );
  }
}
